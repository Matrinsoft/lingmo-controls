macro(lingmo_pch TARGET)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs PUBLIC PRIVATE)
    cmake_parse_arguments(PCH "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    target_precompile_headers(${TARGET}
        PUBLIC ${PCH_PUBLIC}
        PRIVATE ${PCH_PRIVATE}
    )
endmacro()
