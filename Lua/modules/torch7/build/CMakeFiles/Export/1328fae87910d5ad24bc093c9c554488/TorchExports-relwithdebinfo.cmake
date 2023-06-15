#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "TH" for configuration "RelWithDebInfo"
set_property(TARGET TH APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(TH PROPERTIES
  IMPORTED_IMPLIB_RELWITHDEBINFO "${_IMPORT_PREFIX}/torch7/TH.lib"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/torch7/TH.dll"
  )

list(APPEND _cmake_import_check_targets TH )
list(APPEND _cmake_import_check_files_for_TH "${_IMPORT_PREFIX}/torch7/TH.lib" "${_IMPORT_PREFIX}/torch7/TH.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
