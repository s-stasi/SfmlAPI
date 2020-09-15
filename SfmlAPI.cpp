#include "SfmlAPI.hpp"

namespace SfmlAPI {
	std::string getSystemUser()
	{
		TCHAR name[UNLEN];
		DWORD size = UNLEN + 1;
		GetUserName((TCHAR*)name, &size);
		std::string uname = name;
		for (size_t i = 0; i < uname.length(); i++)
		{
			if (uname[i] == '\n' && uname[i + 1] == '\n' && uname[i + 1] <= uname.length())
			{
				uname.erase(i, 1);
			}
		}
		return std::string(name);
	}

	float fpsAsMills(unsigned int fps)
	{
		return 1000.f / fps;
	}
	
	float fpsAsSecs(unsigned int fps)
	{
		return 1.f / fps;
	}
}