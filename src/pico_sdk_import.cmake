# This is a copy of the official Raspberry Pi Pico SDK import file
if (DEFINED ENV{PICO_SDK_PATH} AND (NOT PICO_SDK_PATH))
    set(PICO_SDK_PATH "$ENV{PICO_SDK_PATH}")
endif()

if (NOT PICO_SDK_PATH)
    if (EXISTS "${CMAKE_CURRENT_LIST_DIR}/lib/pico-sdk")
        set(PICO_SDK_PATH "${CMAKE_CURRENT_LIST_DIR}/lib/pico-sdk")
    endif()
endif()

if (NOT PICO_SDK_PATH)
    message(FATAL_ERROR "SDK location was not specified. Please set PICO_SDK_PATH or put pico-sdk in lib/pico-sdk")
endif()

set(PICO_SDK_PATH "${PICO_SDK_PATH}" CACHE PATH "Path to the Raspberry Pi Pico SDK" FORCE)

macro(pico_sdk_init)
    include("${PICO_SDK_PATH}/external/pico_sdk_init.cmake")
    project_init()
endmacro()