#ifndef __REQUEST_TLV_H__
#define __REQUEST_TLV_H__

#include <stdio.h>
#include <stdint.h>

#define MAX_NAME_LEN 32
#define MAX_NUM_VAX_DOSES 3

typedef enum {
    R_GET = 0x01,
    R_POST,
    R_PUT,
    R_DELETE,
    R_RESPONSE
} RequestMethod;

typedef enum {
    R_SC_SUCCESS = 0,
    R_SC_UNAUTHORIZED,
    R_SC_NOT_FOUND,
    R_SC_INVALID
} RequestStatusCode;

typedef enum {
    VAX_S_UNVACCINATED = 1,
    VAX_S_PARTIAL_VAXED,
    VAX_S_FULLY_VAXED,
} VaxStatus;

typedef enum {
    VAX_T_ASTRAZENCA = 1,
    VAX_T_BHARAT,
    VAX_T_JANSSEN,
    VAX_T_MODERNA,
    VAX_T_PFIZER,
    VAX_T_SINOPHARM,
    VAX_T_SINOVAC,
    VAX_T_OTHER,
} VaxType;

typedef struct {
    VaxType type;
    uint32_t date; //Date encoded in UNIX timestamp
} vaxDose_t;

typedef struct {
    uint32_t UID;
    char firstName[MAX_NAME_LEN];
    char lastName[MAX_NAME_LEN];
    uint32_t DoB; //Date encoded in UNIX timestamp
    VaxStatus vaxStatus;

    //Stores the info on each vax dose
    int num_vax_doses;
    vaxDose_t vaxDoses[MAX_NUM_VAX_DOSES];
} DBUser;

typedef struct {
    RequestMethod method;
    RequestStatusCode sc;
    DBUser userData;
} DBRequest;

//Decodes a raw User TLV inside buf into the user struct
int DBUser_TlvDecode(uint8_t* tlvRaw, size_t tlvRaw_len, DBUser* user);

//Encodes a DBUser struct into a raw TLV
//Returns length encoded TLV on success, -1 on failure
int DBUser_TlvEncode(DBUser user, uint8_t* tlvRaw, size_t tlvRaw_len);

//Prints user data
void DBUser_print(DBUser user);

//Clears a DBUser Struct
void DBUser_clear(DBUser* user);

//Decodes a raw Request TLV inside buf into the request struct
int DBRequest_TlvDecode(uint8_t* tlvRaw, size_t tlvRaw_len, DBRequest* request);

//Encodes a DBRequest struct into a raw TLV
//Returns length encoded TLV on success, -1 on failure
int DBRequest_TlvEncode(DBRequest request, uint8_t* tlvRaw, size_t tlvRaw_len);

void DBRequest_print(DBRequest request);

//TODO: Function to convert vax status and vax type to string

#endif /* __REQUEST_TLV_H__ */
