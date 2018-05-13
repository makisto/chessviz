CXX=gcc
CFLAGS =  -c -Wall -Werror -std=c99
FLAGS =  -Wall -Werror -std=c99

.PHONY: clean

all: bin build default test

default: bin/chess

test: bin/chess_test

bin/chess: build/main.o build/p.o build/P.o build/board.o
	$(CXX) $(FLAGS) build/main.o build/p.o build/P.o build/board.o -o bin/chess

build/main.o: src/main.c src/p.h src/P.h src/board.h
	$(CXX) $(CFLAGS) src/main.c -o build/main.o

build/p.o: src/p.c src/p.h
	$(CXX) $(CFLAGS) src/p.c -o build/p.o

build/P.o: src/P.c src/P.h
	$(CXX) $(CFLAGS) src/P.c -o build/P.o

build/board.o: src/board.c src/board.h
	$(CXX) $(CFLAGS) src/board.c -o build/board.o

bin/chess_test:build/main_test.o build/p.o build/P.o build/board.o
	$(CXX) $(FLAGS) build/main_test.o build/p.o build/P.o build/board.o -o bin/chess_test

build/main_test.o:test/main.c thirdparty/ctest.h src/p.h src/P.h src/board.h
	$(CXX) $(CFLAGS) -I thirdparty -I src -c test/main.c -o build/main_test.o

build:
	mkdir build

bin:
	mkdir bin

clean:
	-rm -rf build bin
