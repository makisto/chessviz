CXX=gcc
CFLAGS =  -c -Wall -Werror -std=c99
FLAGS =  -Wall -Werror -std=c99
BUILD = build/p.o build/P.o build/board.o build/rook.o build/horse.o build/el.o build/king.o build/queen.o
SRC = src/p.h src/P.h src/board.h src/rook.h src/horse.h src/el.h src/king.h src/queen.h

.PHONY: clean

all: bin build test default 

test: bin/chess_test

default: bin/chess

bin/chess: build/main.o $(BUILD)
	$(CXX) $(FLAGS) build/main.o $(BUILD) -o bin/chess

build/main.o: src/main.c $(SRC)
	$(CXX) $(CFLAGS) src/main.c -o build/main.o

build/p.o: src/p.c src/p.h
	$(CXX) $(CFLAGS) src/p.c -o build/p.o

build/P.o: src/P.c src/P.h
	$(CXX) $(CFLAGS) src/P.c -o build/P.o

build/board.o: src/board.c src/board.h
	$(CXX) $(CFLAGS) src/board.c -o build/board.o

build/rook.o: src/rook.c src/rook.h
	$(CXX) $(CFLAGS) src/rook.c -o build/rook.o

build/horse.o: src/horse.c src/horse.h
	$(CXX) $(CFLAGS) src/horse.c -o build/horse.o

build/el.o: src/el.c src/el.h
	$(CXX) $(CFLAGS) src/el.c -o build/el.o

build/king.o: src/king.c src/king.h
	$(CXX) $(CFLAGS) src/king.c -o build/king.o

build/queen.o: src/queen.c src/queen.h
	$(CXX) $(CFLAGS) src/queen.c -o build/queen.o

bin/chess_test:build/main_test.o $(BUILD)
	$(CXX) $(FLAGS) build/main_test.o $(BUILD) -o bin/chess_test

build/main_test.o:test/main.c 
	$(CXX) $(CFLAGS) -I thirdparty -I src -c test/main.c -o build/main_test.o

build:
	mkdir build

bin:
	mkdir bin

clean:
	-rm -rf build/*.o
