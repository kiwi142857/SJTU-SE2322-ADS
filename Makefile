.PHONY: all clean
all: main

CXXFLAGS := -Wall -Wextra -std=c++23 -pthread -g   -march=native -Ofast

main.o: main.cc waiting_once_api.hpp
waiting_once.o: waiting_once.cc

test: main
	./main
	
main: main.o waiting_once.o
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ -o $@ $(LDLIBS)

clean:
	rm -f *.o main
