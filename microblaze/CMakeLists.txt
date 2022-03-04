# Set project name
project(TLVTest)

# Set minimum version
cmake_minimum_required(VERSION 3.0)

# add_compile_definitions(ETLV_DEBUG)

# Add source files
file(GLOB SRC_TLVTest
    ./*.c
    ./easytlv/*.c
    ./easytlv/test/*.c
)

# Add files to library
add_library(TLVtest STATIC 
    ${SRC_TLVTest}
)

# Add include directory for library
# PUBLIC allows includes to propagate to any user of the library 
target_include_directories(TLVtest PUBLIC 
    ./
    ./easytlv/
    # ./easytlv/test/
)

if (APPLE)
	target_link_directories(TLVtest PUBLIC /usr/local/lib /usr/lib)
endif (APPLE)

# Set source for main
set(SRC_MAIN ${CMAKE_CURRENT_SOURCE_DIR}/TLV_test.c)

# Add main executable
add_executable(TLV_test ${SRC_MAIN})

# Link against  libraries
target_link_libraries(TLV_test TLVtest)