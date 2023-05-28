@echo off
"C:\\Users\\makpu\\AppData\\Local\\Android\\Sdk\\ndk\\23.2.8568313\\ndk-build.cmd" ^
  "NDK_PROJECT_PATH=null" ^
  "APP_BUILD_SCRIPT=C:\\Users\\makpu\\Downloads\\proj\\Projects\\Lua\\Android-LOVE\\love\\src\\jni\\Android.mk" ^
  "APP_ABI=arm64-v8a" ^
  "NDK_ALL_ABIS=arm64-v8a" ^
  "NDK_DEBUG=0" ^
  "APP_PLATFORM=android-16" ^
  "NDK_OUT=C:\\Users\\makpu\\Downloads\\proj\\Projects\\Lua\\Android-LOVE\\love\\build\\intermediates\\cxx\\Release\\6h5345s3/obj" ^
  "NDK_LIBS_OUT=C:\\Users\\makpu\\Downloads\\proj\\Projects\\Lua\\Android-LOVE\\love\\build\\intermediates\\cxx\\Release\\6h5345s3/lib" ^
  -j16 ^
  "APP_SHORT_COMMANDS=false" ^
  "LOCAL_SHORT_COMMANDS=false" ^
  -B ^
  -n
