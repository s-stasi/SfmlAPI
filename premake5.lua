-- premake5.lua
workspace "SfmlAPI"
	configurations
	{
    "Debug",
    "Release"
	}

   platforms
   {
      "x86",
      "x86_64"
   }

   location "build"


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "SfmlAPI"
   kind "StaticLib"
   language "C++"
   location "build"

   targetdir("bin/" .. outputdir .. "/%{prj.name}")
   objdir("bin-int/" .. outputdir .. "/%{prj.name}")

   includedirs
   {
      "include",
      "vendor/include"
   }

   files { "**.cpp" }


   filter "platforms:x86"
      architecture "x86"

   filter "platforms:x86_64"
      architecture "x86_64"

----------------------------------------------------------------------
----------- Windows section ------------------------------------------
----------------------------------------------------------------------
   filter "system:Windows"
      cppdialect "c++11"
      staticruntime "On"
      systemversion "latest"

   filter { "platforms:Debug", "system:Windows" }
      defines { "DEBUG" }
      symbols "On"
      links
      {
         "sfml-graphics-s-d.lib",
         "sfml-system-s-d.lib",
         "sfml-audio-s-d.lib",
         "sfml-network-s-d.lib",
         "sfml-main-s-d.lib"
      }

   filter {"platforms:Release", "system:Windows"} 
      defines { "NDEBUG" }
      optimize "On"
      links
      {
         "sfml-graphics-s.lib",
         "sfml-system-s.lib",
         "sfml-audio-s.lib",
         "sfml-network-s.lib",
         "sfml-main-s.lib"
      }

   filter {"platforms:Debug", "platforms:x86", "system:Windows" }
      libdirs { "vendor/sfml/lib/msvc/x86" }

   filter {"platforms:Release", "platforms:x86_64", "system:Windows" }
      libdirs { "vendor/sfml/lib/msvc/x64" }

----------------------------------------------------------------------
----------- Linux section --------------------------------------------
----------------------------------------------------------------------
   filter "system:Linux"
      cppdialect "c++11"
      systemversion "latest"

   filter { "platforms:Debug", "system:Linux" }
      defines { "DEBUG" }
      symbols "On"
      links
      {
         "sfml-graphics-s-d.lib",
         "sfml-system-s-d.lib",
         "sfml-audio-s-d.lib",
         "sfml-network-s-d.lib",
         "sfml-main-s-d.lib"
      }

   filter {"platforms:Release", "system:Linux"} 
      defines { "NDEBUG" }
      optimize "On"
      links
      {
         "sfml-graphics-s.lib",
         "sfml-system-s.lib",
         "sfml-audio-s.lib",
         "sfml-network-s.lib",
         "sfml-main-s.lib"
      }

   filter {"platforms:Debug", "platforms:x86", "system:Linux" }
      libdirs { "vendor/sfml/lib/msvc/x86" }

   filter {"platforms:Release", "platforms:x86_64", "system:Linux" }
      libdirs { "vendor/sfml/lib/msvc/x64" }