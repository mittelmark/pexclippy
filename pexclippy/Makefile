##-*- makefile -*- ##
### file: Makefile
CC     := g++
SRCS   := pexclippy.cpp pex.cpp
HDRS   := pexclippy.hpp pex.hpp
OBJS   := pexclippy.o pex.o
CFLAGS := -O3 -Wall -std=c++17
LFLAGS := -lncurses
LINTER := clang-tidy
LNFLAGS:= -- -std=c++17
FORMATTER := clang-format -i
# $@ - target
# $< - first requirement
# $^ - all requirements
pexclippy: $(OBJS) filesystem/include/ghc/filesystem.hpp
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LFLAGS)
	strip $@

## compile o(bject) files out of cpp files
%.o: %.cpp $(HDRS)
	$(CC) $(CFLAGS) -c $< -o $@

lint: 
	$(LINTER) $(SRCS) $(HDRS) $(LNFLAGS)

format: 
	$(FORMATTER) $(SRCS) $(HDRS)
pex: filesystem/include/ghc/filesystem.hpp
	$(CC) -DPEX $(CFLAGS) pex.cpp -o pex


## as std::filesystem is not in the Pool house 70
filesystem/include/ghc/filesystem.hpp:
	git clone https://github.com/gulrak/filesystem.git
