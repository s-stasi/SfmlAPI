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
      "vendor/sfml/include"
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
      characterset "MBCS"
      staticruntime "On"
      systemversion "latest"

   filter { "configurations:Debug", "system:Windows" }
      defines { "DEBUG" }
      symbols "On"
      links
      {
         "sfml-graphics-s-d.lib",
         "sfml-system-s-d.lib",
         "sfml-audio-s-d.lib",
         "sfml-network-s-d.lib"
      }

   filter {"configurations:Release", "system:Windows"} 
      defines { "NDEBUG" }
      optimize "On"
      links
      {
         "sfml-graphics-s.lib",
         "sfml-system-s.lib",
         "sfml-audio-s.lib",
         "sfml-network-s.lib"
      }

   filter { "platforms:x86", "system:Windows" }
      libdirs { "vendor/sfml/lib/msvc/x86/" }

   filter { "platforms:x86_64", "system:Windows" }
      libdirs { "vendor/sfml/lib/msvc/x64/" }

----------------------------------------------------------------------
----------- Linux section --------------------------------------------
----------------------------------------------------------------------
   filter "system:Linux"
      cppdialect "c++11"
      systemversion "latest"

   filter { "configurations:Debug", "system:Linux" }
      defines { "DEBUG" }
      symbols "On"
      links
      {
         "sfml-graphics-s-d",
         "sfml-system-s-d",
         "sfml-audio-s-d",
         "sfml-network-s-d",
         "sfml-main-s-d"
      }

   filter {"configurations:Release", "system:Linux"} 
      defines { "NDEBUG" }
      optimize "On"
      links
      {
         "sfml-graphics-s",
         "sfml-system-s",
         "sfml-audio-s",
         "sfml-network-s",
         "sfml-main-s"
      }

   filter {"configurations:Debug", "platforms:x86", "system:Linux" }
      libdirs { "vendor/sfml/lib/gcc/x86" }

   filter {"configurations:Release", "platforms:x86_64", "system:Linux" }
      libdirs { "vendor/sfml/lib/gcc/x64" }