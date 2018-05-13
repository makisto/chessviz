CXX=gcc
CFLAGS =  -c -Wall -Werror -std=c99

.PHONY: clean

all: bin build bin/chess

bin/chess: build/main.o build/p.o build/P.o build/board.o
	$(CXX) build/main.o build/p.o build/P.o build/board.o -o bin/chess

build/main.o: src/main.c src/p.h src/P.h src/board.h
	$(CXX) $(CFLAGS) src/main.c -o build/main.o

build/p.o: src/p.c src/p.h
	$(CXX) $(CFLAGS) src/p.c -o build/p.o

build/P.o: src/P.c src/P.h
	$(CXX) $(CFLAGS) src/P.c -o build/P.o

build/board.o: src/board.c src/board.h
	$(CXX) $(CFLAGS) src/board.c -o build/board.o

build:
	mkdir build

bin:
	mkdir bin

clean:
	-rm -rf build bin
