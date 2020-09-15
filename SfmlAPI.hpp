#pragma once
#include <algorithm>
#include <windows.h>
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