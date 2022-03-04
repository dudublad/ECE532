#include "TLVUtils.h"

bool is_big_endian()
{
    int i=1;
    return ! *((char *)&i);
}