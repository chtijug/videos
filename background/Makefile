LOGOS := $(wildcard logos/*)

default: background_screen_speaker.png

%.png: %.svg $(LOGOS)
	inkscape -f $< -e $@
