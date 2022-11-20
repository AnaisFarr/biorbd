# - Find biorbd
# Find the native biorbd includes and libraries
#
#  biorbd_INCLUDE_DIR - where to find biorbd.h, etc.
#  biorbd_LIBRARIES   - List of libraries when using biorbd.
#  biorbd_FOUND       - True if biorbd is found.

if (biorbd_INCLUDE_DIR)
  # Already in cache, be silent
  set (biorbd_FIND_QUIETLY TRUE)
endif (biorbd_INCLUDE_DIR)

find_path (biorbd_INCLUDE_DIR "BiorbdModel.h" PATHS ${CMAKE_INSTALL_PREFIX}/include/biorbd)
find_library (biorbd_LIBRARY NAMES biorbd biorbd_debug PATHS ${CMAKE_INSTALL_PREFIX}/lib/biorbd)

get_filename_component(biorbd_LIB_PATH ${biorbd_LIBRARY} DIRECTORY)
get_filename_component(biorbd_LIB_NAME ${biorbd_LIBRARY} NAME_WE)
get_filename_component(biorbd_LIB_EXTENSION ${biorbd_LIBRARY} EXT)

string(REGEX MATCH "_debug" debug_flag ${biorbd_LIB_NAME})
if (debug_flag)
    string(REGEX REPLACE ${debug_flag} "" biorbd_LIB_NAME ${biorbd_LIB_NAME})
endif()

set(biorbd_LIBRARIES
    ${biorbd_LIB_PATH}/${biorbd_LIB_NAME}${debug_flag}${biorbd_LIB_EXTENSION}
    ${biorbd_LIB_PATH}/${biorbd_LIB_NAME}_utils${debug_flag}${biorbd_LIB_EXTENSION}
    ${biorbd_LIB_PATH}/${biorbd_LIB_NAME}_rigidbody${debug_flag}${biorbd_LIB_EXTENSION}
    ${biorbd_LIB_PATH}/${biorbd_LIB_NAME}_internal_forces${debug_flag}${biorbd_LIB_EXTENSION}
    ${biorbd_LIB_PATH}/${biorbd_LIB_NAME}_muscles${debug_flag}${biorbd_LIB_EXTENSION}
    ${biorbd_LIB_PATH}/${biorbd_LIB_NAME}_actuators${debug_flag}${biorbd_LIB_EXTENSION}
    ${biorbd_LIB_PATH}/${biorbd_LIB_NAME}_passive_torques${debug_flag}${biorbd_LIB_EXTENSION}
    ${biorbd_LIB_PATH}/${biorbd_LIB_NAME}_ligaments${debug_flag}${biorbd_LIB_EXTENSION}
)

# handle the QUIETLY and REQUIRED arguments and set biorbd_FOUND to TRUE if 
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (biorbd DEFAULT_MSG 
  biorbd_LIBRARIES
  biorbd_INCLUDE_DIR
)

