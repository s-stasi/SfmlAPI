-- premake5.lua
workspace "SfmlAPI"
   configurations { "Debug",  "Release" }
   platforms { "x86", "x86_64" }
   location "build"

project "SfmlAPI"
   kind "StaticLib"
   language "C++"
   location "build"
   targetdir "bin/%{cfg.buildcfg}"

   includedirs { "include", "vendor/include" }
   files { "**.cpp" }
   
   filter "platforms:x86"
      architecture "x86"

   filter "platforms:x86_64"
      architecture "x86_64"

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"
      links { "sfml-graphics-s-d.lib", "sfml-system-s-d.lib", "sfml-audio-s-d.lib", "sfml-network-s-d.lib", "sfml-main-s-d.lib"}

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      links { "sfml-graphics-s.lib", "sfml-system-s.lib", "sfml-audio-s.lib", "sfml-network-s.lib", "sfml-main-s.lib"}

   filter {"configurations:Debug", "platforms:x86"}
      libdirs { "vendor/lib/x86" }

   filter {"configurations:Debug", "platforms:x86_64"}
      libdirs { "vendor/lib/x64" }