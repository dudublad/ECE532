#include "requestTLV.h"

#define TEST_USER_TLV "\x00\x04\x00\x00\x00\x01\x01\x07\x45\x64\x75\x61\x72\x64\x6F\x02\x09\x4F\x72\x74\x65\x6E\x62\x6C\x61\x64\x03\x04\x36\xCE\x41\x50\x04\x01\x02\x05\x01\x05\x06\x04\x60\x92\x18\x40"
#define TEST_REQUEST_TLV "\x01\x02\x00\x02\x02\x2C\x00\x04\x00\x00\x00\x01\x01\x07\x45\x64\x75\x61\x72\x64\x6F\x02\x09\x4F\x72\x74\x65\x6E\x62\x6C\x61\x64\x03\x04\x36\xCE\x41\x50\x04\x01\x02\x05\x01\x05\x06\x04\x60\x92\x18\x40"


int main(int argc, char** argv){
    // uint8_t user_raw[] = TEST_USER_TLV;
    // DBUser user;
    // printf("raw_len = %lu\n", sizeof(user_raw));
    // DBUser_TlvDecode(user_raw, sizeof(user_raw) - 1, &user);
    // DBUser_print(user);

    // uint8_t request_raw[] = TEST_REQUEST_TLV;
    // DBRequest request;
    // // printf("raw_len = %lu\n", sizeof(user_raw));
    // DBRequest_TlvDecode(request_raw, sizeof(request_raw) - 1, &request);
    // DBRequest_print(request);

    printf("Tersting TLV Decoding:\n");
    uint8_t user_raw[] = TEST_USER_TLV;
    DBUser user;
    DBUser_TlvDecode(user_raw, sizeof(user_raw) - 1, &user);
    DBUser_print(user);

    printf("\n\nTesting TLV Encoding:\n");
    uint8_t tlvRaw[255];
    int len = DBUser_TlvEncode(user, tlvRaw, sizeof(tlvRaw));
    if(len < 0) {
        printf("ERROR: DBUser_TlvEncode\n");
    }
    else {
        printf("Encoded TLV:\n");
        for(int i = 0; i < len; i++) {
            printf("%hhx ", tlvRaw[i]);
        }
        printf("\n");
    }
}