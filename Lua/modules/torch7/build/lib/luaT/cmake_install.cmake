# Install script for directory: C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/luaT

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/luaT/Debug/luaT.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/luaT/Release/luaT.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/luaT/MinSizeRel/luaT.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/luaT/RelWithDebInfo/luaT.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE SHARED_LIBRARY FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/Debug/luaT.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE SHARED_LIBRARY FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/Release/luaT.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE SHARED_LIBRARY FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/MinSizeRel/luaT.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE SHARED_LIBRARY FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/RelWithDebInfo/luaT.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/torch7" TYPE FILE FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/lib/luaT/luaT.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake/torch" TYPE FILE FILES "C:/Users/makpu/Downloads/proj/project/Lua/.modules/torch7/build/lib/luaT/cmake-exports/luaTConfig.cmake")
endif()

