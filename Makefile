# Makefile for compile the FLUKA with my code

TARGET = myfluka
CC     = gcc

CCSRCS = CoilMapReader.c
CCOBJS = $(CCSRCS:.c=.o)
FCSRCS = magfld.f
FCOBJS = $(FCSRCS:.f=.o)
OBJS   = $(CCOBJS) $(FCOBJS)

CCFLAGS = -O3 -Wall
CCLIBS  =

.PHONY: all
all: $(TARGET)

$(TARGET):$(OBJS)
	$(FLUPRO)/flutil/lfluka -m fluka $^ -o $@

$(CCOBJS):$(CCSRCS)
	$(CC) $(CCFLAGS) -c $<

$(FCOBJS):$(FCSRCS)
	$(FLUPRO)/flutil/fff $<


.PHONY: clean
clean:
	$(RM) $(OBJS) $(TARGET)
