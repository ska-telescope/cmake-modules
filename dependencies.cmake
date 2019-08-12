macro(find_dependencies)

if(NOT EXISTS "${CMAKE_SOURCE_DIR}/dependencies.txt")
    message(FATAL_ERROR "Cannot find dependencies.txt")
endif()

file(READ "${CMAKE_SOURCE_DIR}/dependencies.txt" depends)
string(REGEX REPLACE "\n" ";" depends "${depends}")
foreach(dependency ${depends})
    set (cmd_list ${dependency})
    separate_arguments(cmd_list)
    list(LENGTH cmd_list len)
    if (${len} GREATER 0)
        list(GET cmd_list 0 type)
        if ((${type} STREQUAL "find") OR (${type} STREQUAL "both"))
            list(REMOVE_AT cmd_list 0)
            find_package(${cmd_list})
        endif()
    endif()
endforeach(dependency)

endmacro(find_dependencies)
