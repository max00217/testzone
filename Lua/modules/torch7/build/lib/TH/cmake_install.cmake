# Install script for directory: C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/makpu/Downloads/proj/project/Lua/.modules")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/TH/Debug/TH.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/TH/Release/TH.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/TH/MinSizeRel/TH.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/TH/RelWithDebInfo/TH.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE SHARED_LIBRARY FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/Debug/TH.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE SHARED_LIBRARY FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/Release/TH.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE SHARED_LIBRARY FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/MinSizeRel/TH.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE SHARED_LIBRARY FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/RelWithDebInfo/TH.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7/TH" TYPE FILE FILES
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/TH.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THAllocator.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THMath.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THBlas.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THDiskFile.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THFile.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THFilePrivate.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/TH/THGeneral.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateAllTypes.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateDoubleType.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateFloatType.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateHalfType.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateLongType.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateIntType.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateShortType.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateCharType.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateByteType.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateFloatTypes.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THGenerateIntTypes.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THLapack.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THLogAdd.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THMemoryFile.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THRandom.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THSize.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THStorage.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THTensor.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THTensorApply.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THTensorDimApply.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THTensorMacros.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THVector.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THAtomic.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/THHalf.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7/TH/vector" TYPE FILE FILES
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/vector/AVX.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/vector/AVX2.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7/TH/generic" TYPE FILE FILES
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THBlas.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THBlas.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THLapack.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THLapack.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THStorage.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THStorage.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THStorageCopy.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THStorageCopy.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensor.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensor.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorConv.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorConv.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorCopy.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorCopy.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorLapack.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorLapack.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorMath.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorMath.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorRandom.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THTensorRandom.h"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THVectorDispatch.c"
    "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/TH/generic/THVector.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake/torch" TYPE FILE FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/TH/cmake-exports/THConfig.cmake")
endif()

