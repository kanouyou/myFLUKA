# Makefile for compile the FLUKA with my code

TARGET = myfluka
CC     = gcc

# c++ code
CXXSRCS  = IPDGEncoding.cpp
CXXOBJS  = $(CXXSRCS:.cpp=.o)
CXXFLAGS = -Wall -O3
CXXLIBS  =

# c code
CCSRCS  = CoilMapReader.c
CCOBJS  = $(CCSRCS:.c=.o)
CCFLAGS = -O3 -Wall
CCLIBS  =

# fortran code
FCSRCS = magfld.f  stuprf.f  mgdraw.f
FCOBJS = $(FCSRCS:.f=.o)

OBJS   = $(CCOBJS) $(FCOBJS) $(CXXOBJS)


.PHONY: all
all: $(TARGET)

$(TARGET):$(OBJS)
	@echo "Generating Target: $@ ..."
	$(FLUPRO)/flutil/lfluka -m fluka $^ -o $@

$(CXXOBJS):$(CXXSRCS)
	@echo "Generating C++ file: $< ..."
	$(CXX) $(CXXFLAGS) -c $<

$(CCOBJS):$(CCSRCS)
	@echo "Generating C file: $< ..."
	$(CC) $(CCFLAGS) -c $<

%.o:%.f
	@echo "Generating Fortran file: $< ..."
	$(FLUPRO)/flutil/fff $<

.PHONY: clean
clean:
	$(RM) $(OBJS) $(TARGET)
	@echo "Cleaning ..."
