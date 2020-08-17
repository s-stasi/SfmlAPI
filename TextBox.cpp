#include <SFML\Graphics.hpp>
#include <sstream>
#include "TextBox.hpp"


namespace SfmlAPI{

	TextBox::TextBox()
	{
	}

	TextBox::TextBox(int size, sf::Color textColor, bool sel)
	{
		textbox.setCharacterSize(size);
		textbox.setFillColor(textColor);
		isSelected = sel;
	}

	void TextBox::setFont(sf::Font &font)
	{
		textbox.setFont(font);
	}

	void TextBox::setPosition(sf::Vector2f pos)
	{
		textbox.setPosition(pos);
	}

	void TextBox::setLimit(bool tof)
	{
		hasLimit = tof;
	}

	void TextBox::setLimit(bool tof, int lim)
	{
		hasLimit = tof;
		limit = lim;
	}

	void TextBox::setSelected(bool sel)
	{
		isSelected = sel;
		if (!sel)
		{
			std::string t = text.str();
			std::string newT = "";
			for (size_t i = 0; i < t.length(); i++)
			{
				newT += t[i];
			}
			textbox.setString(newT);
		}
	}

	std::string TextBox::getText() const
	{
		return text.str();
	}

	void TextBox::draw(sf::RenderWindow &window)
	{
		window.draw(textbox);
	}

	TextBox::~TextBox()
	{
	}

}