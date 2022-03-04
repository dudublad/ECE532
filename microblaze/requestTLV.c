#include "requestTLV.h"
#include "easytlv.h"
#include <stdint.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <stdlib.h> 
#include <arpa/inet.h>

#define MAX_DBREQUEST_TLV_ENTRIES 2
#define MAX_DBUSER_TLV_ENTRIES 11

#define DBREQUEST_HEADER_LEN 2

#define min(a,b) \
   ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
     _a < _b ? _a : _b; })

typedef enum {
    RTLV_T_HEADER = 0x01,
    RTLV_T_BODY = 0x02
} RequestTLVType;

typedef enum {
    UTLV_T_UID = 0x00,
    UTLV_T_FIRST_NAME,
    UTLV_T_LAST_NAME,
    UTLV_T_DOB,
    UTLV_T_VAX_STATUS,
    UTLV_T_FIRST_DOSE_VAX,
    UTLV_T_FIRST_DOSE_DATE,
    UTLV_T_SECOND_DOSE_VAX,
    UTLV_T_SECOND_DOSE_DATE,
    UTLV_T_THIRD_DOSE_VAX,
    UTLV_T_THIRD_DOSE_DATE,
}UserTLVType;

static bool is_big_endian()
{
    int i=1;
    return ! *((char *)&i);
}

static void tlvcpy(void* dst, const void* src, size_t len) {
    if(is_big_endian()) {
        memcpy(dst, src, len);
    } else {
        for(int i=0; i<len; i++) {
            ((uint8_t*) dst)[len-i-1] = ((uint8_t*) src)[i];
        }
    }
}

//Decodes the TLV inside buf into the user struct
int DBUser_TlvDecode(uint8_t* tlvRaw, size_t tlvRaw_len, DBUser* user) {
    ETLVToken tlv[MAX_DBUSER_TLV_ENTRIES];
    int nTok = sizeof(tlv)/sizeof(tlv[0]); //number of entries in TLV array

    int err = etlv_parse(tlv, &nTok, tlvRaw, tlvRaw_len);
    // printf("err = %d\n", err);
    assert(err >= 0);

    user->num_vax_doses = 0;
    for(int i = 0; i < nTok; i++) {
        ETLVToken tok = tlv[i];

        if(tok.tag == UTLV_T_UID) {
            int len = min(sizeof(user->UID), tok.len);
            tlvcpy(&(user->UID), tok.val, len);
        } 
        else if(tok.tag == UTLV_T_FIRST_NAME) {
            int len = min(MAX_NAME_LEN, tok.len);
            strncpy(user->firstName, (char*) tok.val, len);
        }
        else if(tok.tag == UTLV_T_LAST_NAME) {
            int len = min(MAX_NAME_LEN, tok.len);
            strncpy(user->lastName, (char*) tok.val, len);
        }
        else if(tok.tag == UTLV_T_DOB) {
            int len = min(sizeof(user->DoB), tok.len);
            tlvcpy(&(user->DoB), tok.val, len);
        }
        else if(tok.tag == UTLV_T_VAX_STATUS) {
            int len = min(sizeof(user->vaxStatus), tok.len);
            tlvcpy(&(user->vaxStatus), tok.val, len);
        }
        else if(tok.tag >= UTLV_T_FIRST_DOSE_VAX && tok.tag <= UTLV_T_THIRD_DOSE_DATE) {
            if((tok.tag - UTLV_T_FIRST_DOSE_VAX) % 2 == 0) {
                //Vax Dose Type
                int idx = (tok.tag - UTLV_T_FIRST_DOSE_VAX)/2;
                user->num_vax_doses++;
                int len = min(sizeof(VaxType), tok.len);
                tlvcpy(&(user->vaxDoses[idx].type), tok.val, len);
            }
            else {
                //Vax date type
                int idx = (tok.tag - UTLV_T_FIRST_DOSE_DATE)/2;
                int len = min(sizeof(uint32_t), tok.len);
                tlvcpy(&(user->vaxDoses[idx].date), tok.val, len);
            }
        }
        else {
            printf("Unknown DBUser TLV Type: %d\n", tok.tag);
        }
    }

    return 0;
}

int DBUser_TlvEncode(DBUser user, uint8_t* tlvRaw, size_t tlvRaw_len) {
    int nTok = 5 + (2 * user.num_vax_doses);

    ETLVToken* tlv = (ETLVToken*)malloc(nTok * sizeof(ETLVToken));
    if(tlv == NULL){
        printf("DBUser_TlvEncode malloc failed\n");
        return -1;
    }

    int idx = 0;

    tlv[idx].tag = UTLV_T_UID;
    tlv[idx].len = 4;
    //convert to Big Endian
    uint32_t uid = htonl(user.UID);
    tlv[idx].val = &uid;
    idx++;

    tlv[idx].tag = UTLV_T_FIRST_NAME;
    tlv[idx].len = strlen(user.firstName);
    tlv[idx].val = user.firstName;
    idx++;

    tlv[idx].tag = UTLV_T_LAST_NAME;
    tlv[idx].len = strlen(user.lastName);
    tlv[idx].val = user.lastName;
    idx++;

    tlv[idx].tag = UTLV_T_DOB;
    tlv[idx].len = 4;
    //convert to Big Endian
    uint32_t dob = htonl(user.DoB);
    tlv[idx].val = &dob;
    idx++;

    tlv[idx].tag = UTLV_T_VAX_STATUS;
    tlv[idx].len = 1;
    tlv[idx].val = &user.vaxStatus;
    idx++;

    uint32_t vax_dates[MAX_NUM_VAX_DOSES]; //big endian
    for(int i = 0; i < user.num_vax_doses; i++) {
        tlv[idx].tag = UTLV_T_FIRST_DOSE_VAX + i*2;
        tlv[idx].len = 1;
        tlv[idx].val = &user.vaxDoses[i].type;
        idx++;

        tlv[idx].tag = UTLV_T_FIRST_DOSE_DATE + i*2;
        tlv[idx].len = 4;
        //convert to Big Endian
        vax_dates[i] = htonl(user.vaxDoses[i].date);
        tlv[idx].val = &vax_dates[i];
        idx++;
    }

    int err = etlv_serialize(tlvRaw, &tlvRaw_len, tlv, nTok);
    assert(err >= 0);

    free(tlv);
    return tlvRaw_len;
}

void DBUser_print(DBUser user) {
    printf("=== DBUser ===\n");
    printf("UID: %d\n", user.UID);
    printf("First Name: %s\n", user.firstName);
    printf("Last Name: %s\n", user.lastName);
    printf("Date of Birth: %u\n", user.DoB);
    printf("Vaccination Status: %d\n", user.vaxStatus);
    printf("Number of doses: %d\n", user.num_vax_doses);
    for(int i = 0; i < user.num_vax_doses; i++) {
        printf("Dose %d:\n", i + 1);
        printf("Type: %d, Date: %u\n", user.vaxDoses[i].type, user.vaxDoses[i].date);
    }
}

int DBRequest_TlvDecode(uint8_t* tlvRaw, size_t tlvRaw_len, DBRequest* request) {
    ETLVToken tlv[MAX_DBREQUEST_TLV_ENTRIES];
    int nTok = sizeof(tlv)/sizeof(tlv[0]); //number of entries in TLV array

    int err = etlv_parse(tlv, &nTok, tlvRaw, tlvRaw_len);
    assert(err >= 0);

    for(int i = 0; i < nTok; i++) {
        ETLVToken tok = tlv[i];

        if(tok.tag == RTLV_T_HEADER) {
            if(tok.len != DBREQUEST_HEADER_LEN) {
                printf("Incorrect DBRequest TLV Header length\n");
                return -1;
            }
            request->method = ((uint8_t*) tok.val)[1];
            request->sc = ((uint8_t*) tok.val)[0];
        }
        else if(tok.tag == RTLV_T_BODY) {
            int ret = DBUser_TlvDecode((uint8_t*) tok.val, tok.len, &request->userData);

            if(ret < 0) return ret;
        }
        else {
            printf("Unknown DBRequest TLV Type: %d\n", tok.tag);
        }
    }

    return 0;
}

void DBRequest_print(DBRequest request) {
    printf("=== DBRequest ===\n");
    printf("Method: %d\n", request.method);
    printf("Status Code: %d\n", request.sc);
    DBUser_print(request.userData);
}