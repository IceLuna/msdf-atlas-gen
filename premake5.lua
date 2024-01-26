project "MSDF-Atlas"
    kind "Staticlib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "**.h",
        "**.cpp"
    }

    includedirs
	{
		"msdf-atlas-gen/",
		"msdfgen/",
		"artery-font-format/",
		"tinyxml2/",
		"freetype/include/"
	}

    defines
    {
        "MSDF_ATLAS_PUBLIC="
    }

    links
    {
        "freetype.lib"
    }

    filter "system:windows"
        systemversion "latest"

    filter { "system:windows", "configurations:Debug" }
        runtime "Debug"
        optimize "Speed"

    filter { "system:windows", "configurations:Release" }
        runtime "Release"
        optimize "Speed"

    filter { "system:windows", "configurations:Dist" }
        runtime "Release"
        optimize "Speed"
