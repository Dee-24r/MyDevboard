cmake_minimum_required(VERSION 3.13)

# Pull in Raspberry Pi Pico SDK (make sure PICO_SDK_PATH is set in your environment)
include(pico_sdk_import.cmake)

project(d_board_test C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_executable(d_board_test
    main.c
)

# Pull in pico_stdlib which provides commonly used features
target_link_libraries(d_board_test 
    pico_stdlib
)

# Enable usb output, disable uart output if using native USB CDC
pico_enable_stdio_usb(d_board_test 1)
pico_enable_stdio_uart(d_board_test 0)

pico_add_extra_outputs(d_board_test)