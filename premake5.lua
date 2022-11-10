-- premake5.lua
workspace "tolua"
   configurations { "Debug", "Release" }

project "tolua"
   kind "SharedLib"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"

   files {
      '"luajit-2.1/src/*.c',
      'tolua.c',
      'int64.c',
      'uint64.c',
      'pb.c',
      'lpeg.c',
      'struct.c',
      'cjson/strbuf.c',
      'cjson/lua_cjson.c',
      'cjson/fpconv.c',
      'luasocket/auxiliar.c',
      'luasocket/buffer.c',
      'luasocket/except.c',
      'luasocket/inet.c',
      'luasocket/io.c',
      'luasocket/luasocket.c',
      'luasocket/mime.c',
      'luasocket/options.c',
      'luasocket/select.c',
      'luasocket/tcp.c',
      'luasocket/timeout.c',
      'luasocket/udp.c',
      'luasocket/wsocket.c',
    }
   includedirs { "luasocket" }
   includedirs { "cjson" }
   includedirs { "luajit-2.1/src" }

   defines{"_CRT_SECURE_NO_WARNINGS"}
   filter "configurations:Debug"
      defines { "DEBUG","_WIN32_WCE" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG", "_WIN32_WCE"}
      optimize "On"