@echo off
"C:\\Users\\makpu\\AppData\\Local\\Android\\Sdk\\ndk\\23.2.8568313\\ndk-build.cmd" ^
  "NDK_PROJECT_PATH=null" ^
  "APP_BUILD_SCRIPT=C:\\Users\\makpu\\Downloads\\proj\\Projects\\Lua\\.modules\\love-android\\love\\src\\jni\\Android.mk" ^
  "NDK_APPLICATION_MK=C:\\Users\\makpu\\Downloads\\proj\\Projects\\Lua\\.modules\\love-android\\love\\src\\jni\\Application.mk" ^
  "APP_ABI=arm64-v8a" ^
  "NDK_ALL_ABIS=arm64-v8a" ^
  "NDK_DEBUG=0" ^
  "APP_PLATFORM=android-16" ^
  "NDK_OUT=C:\\Users\\makpu\\Downloads\\proj\\Projects\\Lua\\.modules\\love-android\\love\\build\\intermediates\\cxx\\Release\\4f3e1l2e/obj" ^
  "NDK_LIBS_OUT=C:\\Users\\makpu\\Downloads\\proj\\Projects\\Lua\\.modules\\love-android\\love\\build\\intermediates\\cxx\\Release\\4f3e1l2e/lib" ^
  -j16 ^
  SDL2 ^
  love ^
  mpg123 ^
  openal
