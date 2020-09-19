#pragma once
#include <algorithm>
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__)
	#include <windows.h>
#endif
#include <Lmcons.h>
#include "Button.hpp"
#include "Menu.hpp"
#include "TextBox.hpp"

namespace SfmlAPI {
	class Button;
	class Menu;
	class TextBox;
	std::string getSystemUser();
	float fpsAsMills(unsigned int fps);
	float fpsAsSecs(unsigned int fps);
}