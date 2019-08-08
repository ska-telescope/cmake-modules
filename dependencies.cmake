macro(install_dependencies)

if(NOT EXISTS "${CMAKE_SOURCE_DIR}/dependencies.txt")
    message(FATAL_ERROR "Cannot find dependencies.txt")
endif()

file(READ "${CMAKE_SOURCE_DIR}/dependencies.txt" depends)
string(REGEX REPLACE "\n" ";" depends "${depends}")
foreach(dependency ${depends})
    message(STATUS finding ${dependency})
endforeach(dependency)

endmacro(install_dependencies)
