#ifndef __TLV_UTILS_H__
#define __TLV_UTILS_H__

#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>

bool is_big_endian();

void tlvcpy(void* dst, void* src, size_t len);

#endif /* __TLV_UTILS_H__ */