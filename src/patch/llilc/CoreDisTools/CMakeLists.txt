project(coredistools)

set(CMAKE_BUILD_TYPE "${COREDISTOOLS_BUILD_TYPE}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COREDISTOOLS_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COREDISTOOLS_CXX_FLAGS}")

if(WIN32)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc")
endif()

if(NOT WIN32)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fno-rtti")
endif()

message(STATUS "CoreDisTools configuring with (${CMAKE_BUILD_TYPE}) build type and (${LLVM_DEFAULT_TARGET_TRIPLE}) default target triple")

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(.)
add_definitions(${LLVM_DEFINITIONS})

if (WIN32)
  # Create .def file containing a list of exports preceeded by
  # 'EXPORTS'.  The file "coredistools.exports" already contains the list, so we
  # massage it into the correct format here to create "coredistools.exports.def".
  set(COREDISTOOLS_EXPORTS_DEF ${CMAKE_CURRENT_BINARY_DIR}/coredistools.exports.def)
  set(COREDISTOOLS_EXPORTS_DEF_TEMP ${COREDISTOOLS_EXPORTS_DEF}.txt)
  file(READ "coredistools.exports" exports_list)
  file(WRITE ${COREDISTOOLS_EXPORTS_DEF_TEMP} "LIBRARY COREDISTOOLS\n")
  file(APPEND ${COREDISTOOLS_EXPORTS_DEF_TEMP} "EXPORTS\n")
  file(APPEND ${COREDISTOOLS_EXPORTS_DEF_TEMP} ${exports_list})
  # Copy the file only if it has changed.
  execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${COREDISTOOLS_EXPORTS_DEF_TEMP} ${COREDISTOOLS_EXPORTS_DEF})
endif()

# Now build our tools
add_library(coredistools
   SHARED
   coredistools.cpp
   ${COREDISTOOLS_EXPORTS_DEF}
)

# Find the libraries that correspond to the LLVM components
# that we wish to use
llvm_map_components_to_libnames(llvm_libs
  ${LLVM_TARGETS_TO_BUILD}
)

# Link against LLVM libraries
target_link_libraries(coredistools
${llvm_libs})
