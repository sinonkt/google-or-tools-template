#
# 'make'        build executable file 'knapsack'
# 'make clean'  removes all .o and executable files
#
OR_TOOLS_HOME?=/or-tools

# define the Compiler to use
CXX = g++

# define any compile-time flags
CXXFLAGS = -fPIC -std=c++17 -O4 -DNDEBUG -DARCH_K8 -Wno-deprecated -DUSE_BOP -DUSE_GLOP -DUSE_CBC -DUSE_CLP -DUSE_SCIP

INCLUDES = -I$(OR_TOOLS_HOME)/include

LDFLAGS = -Llib -Llib64 -L${OR_TOOLS_HOME}/lib

LIBS = -lz -lrt -lpthread -lortools

all:
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c knapsack.cc $(LDFLAGS) $(LIBS) -o knapsack.o
	$(CXX) $(CXXFLAGS) $(INCLUDES) knapsack.o $(LDFLAGS) $(LIBS) -o knapsack

clean:
	$(RM) *.o knapsack
