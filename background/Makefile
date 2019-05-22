LOGOS := $(wildcard logos/*)
SOURCES := $(wildcard *.svg)
TARGETS := $(patsubst %.svg,%.png,$(SOURCES))

default: all

all: $(TARGETS)

%.png: %.svg $(LOGOS)
	inkscape -f $< -e $@
