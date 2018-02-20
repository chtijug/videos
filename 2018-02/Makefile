TITLE             := Ch'ti JUG - Be in, learn Kotlin
COMMENT           := Ch'ti JUG - Session Kotlin présentée par Salomon BRYS le 15 février 2018 chez AXA
INTRO             := intro
OUTPUT            := output.mov
DURATION          := 5290 # 01:28:10
COMPUTER          := computer.mov
COMPUTER_START_TS := 00:00:20.573
SPEAKER           := speaker.mp4
SPEAKER_START_TS  := 00:00:50.773
BACKGROUND        := background.png
YEAR              := $(shell date "+%Y")

.PHONY: clean default mrproper

default: $(OUTPUT)

$(INTRO).mov: Rush/$(INTRO).png
	ffmpeg -loop 1 -i $< -f lavfi -i anullsrc=channel_layout=1 -c:a aac -c:v libx264 -vf "fade=in:0:25,fade=out:50:25" -t 3 -pix_fmt yuv420p $@

$(COMPUTER): Rush/$(COMPUTER)
	ffmpeg -y -i $< -map_metadata -1 -ss $(COMPUTER_START_TS) -t $(DURATION) -c copy $@

$(SPEAKER): Rush/$(SPEAKER)
	ffmpeg -y -i $< -map_metadata -1 -ss $(SPEAKER_START_TS) -t $(DURATION) -c copy $@

$(OUTPUT): $(COMPUTER) $(SPEAKER) $(BACKGROUND) $(INTRO).mov
	ffmpeg -y \
		-i $(COMPUTER) \
		-i $(SPEAKER) \
		-i $(BACKGROUND) \
		-i $(INTRO).mov \
		-i $(INTRO).mov \
		-filter_complex " \
			nullsrc=size=1920x1080 [base]; \
			[0:v] setpts=PTS-STARTPTS, scale=1280x720 [laptop]; \
			[1:v] setpts=PTS-STARTPTS, scale=1280x720, crop=w=540:h=720:x=370:y=0, eq=brightness=0.2 [speaker]; \
			[2:v] scale=1920x1080 [background]; \
			[3:v] setpts=PTS-STARTPTS, scale=1920x1080 [intro]; \
			[4:v] setpts=PTS-STARTPTS, scale=1920x1080 [outro]; \
			[base][background] overlay=shortest=0 [base+background]; \
			[base+background][laptop] overlay=shortest=1:x=33:y=180 [background+laptop]; \
			[background+laptop][speaker] overlay=shortest=1:repeatlast=0:x=1343:y=180 [background+laptop+speaker]; \
			[background+laptop+speaker] fade=in:0:25,fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[0:a] volume=-10dB,afade=in:ss=0:d=1,afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[intro][3:a][vsession][asession][outro][4:a] concat=n=3:v=1:a=1 \
		" \
		-metadata album="Ch'ti JUG" \
		-metadata album_artist="Ch'ti JUG <team@chtijug.org>" \
		-metadata author="Ch'ti JUG <team@chtijug.org>" \
		-metadata comment="$(COMMENT)" \
		-metadata title="$(TITLE)" \
		-metadata year="$(YEAR)" \
		$@

clean:
	$(RM) $(OUTPUT)

mrproper: clean
	$(RM) $(INTRO).mov
	$(RM) $(COMPUTER)
	$(RM) $(SPEAKER)
