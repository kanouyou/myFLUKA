# Makefile for compile the FLUKA with my code

TARGET = myfluka
SLIBS  = libFLKEvent.so
CC     = gcc
CXX    = g++
CINT   = rootcint

# cint
CINTHEAD  = IFLUKAEvent.h  IFLUKAEvent_LinkDef.h
CINTSRCS  = IFLUKAEventDict.cpp
ROOTLIBS  = `root-config --glibs`
ROOTFLAGS = `root-config --cflags`

# c++ code
CXXSRCS1 = IPDGEncoding.cpp  #IFLUKARootDraw.cpp  IFLUKALinker.cpp
CXXSRCS := IFLUKAEvent.cpp  $(CINTSRCS)
CXXOBJS1 = $(CXXSRCS1:.cpp=.o)
CXXOBJS  = $(CXXSRCS:.cpp=.o) 
CXXFLAGS := -Wall -O3  $(ROOTFLAGS)
CXXLIBS  = $(ROOTLIBS)

# c code
CCSRCS  = CoilMapReader.c
CCOBJS  = $(CCSRCS:.c=.o)
CCFLAGS = -O3 -Wall
CCLIBS  =

# fortran code
FCSRCS = magfld.f  stuprf.f  mgdraw.f  usrini.f  usrout.f
FCOBJS = $(FCSRCS:.f=.o)

OBJS   = $(CCOBJS) $(FCOBJS) $(CXXOBJS)


.PHONY: all
all: $(TARGET)

$(TARGET):$(CCOBJS) $(FCOBJS) $(CXXOBJS1)
	@echo "Generating Target: $@ ..."
	$(FLUPRO)/flutil/lfluka  -m fluka $^ -o $@

#$(SLIBS): $(CINTHEAD) $(CXXOBJS)
#	$(CXX) -shared -O  $(CXXOBJS) $(CXXLIBS) -o $@

#$(CXXOBJS): $(CXXSRCS)
%.o: %.cpp
	@echo "Generating C++ file: $@ ..."
	$(CXX) $(CXXFLAGS) -fPIC -c $<

$(CCOBJS): $(CCSRCS)
	@echo "Generating C file: $@ ..."
	$(CC) $(CCFLAGS) -c $<

%.o:%.f
	@echo "Generating Fortran file: $@ ..."
	$(FLUPRO)/flutil/fff $<

#$(CINTSRCS): $(CINTHEAD)
#	$(CINT) -f $@ -c -p $^

.PHONY: clean
clean:
	@echo "Cleaning ..."
	$(RM) $(OBJS) $(CXXOBJS1) $(CINTSRCS) $(TARGET) $(SLIBS)
