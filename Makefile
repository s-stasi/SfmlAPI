#Makefile for "Snake" C++ application
#Created by Stasi Samuele  09/2020


PROG = libSfmlAPI.a
CC = g++
OBJ = SfmlAPI.o Button.o Menu.o TextBox.o
LIBSFML = -lsfml-network -lsfml-audio -lsfml-graphics -lsfml-window -lsfml-system

$(PROG): $(OBJ)
	ar r $(PROG) $(OBJ)

%.o: %.cpp %.hpp
	$(CC) -c $^ $(LIBSFML)

clean :
	rm *.o $(PROG)