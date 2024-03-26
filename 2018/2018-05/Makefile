TITLE             := Ch'ti JUG - PostgreSQL is YeSQL!
COMMENT           := Ch'ti JUG - Session PostgreSQL présentée par Dimitri Fontaine le 22 mai 2018 à Euratechnologies
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := output.mp4
DURATION          := 5408# 01:30:08
COMPUTER          := Rush/computer.mov
COMPUTER_START_TS := 00:03:49
SPEAKER           := Rush/speaker.mov
SPEAKER_START_TS  := 00:03:49
BACKGROUND        := ../../background/background_screen_speaker_4_3.png
YEAR              := $(shell date "+%Y")

.PHONY: clean default

default: $(OUTPUT)

$(OUTPUT): $(COMPUTER) $(SPEAKER) $(BACKGROUND) $(INTRO) $(OUTTRO)
	ffmpeg -y \
		-ss $(COMPUTER_START_TS) -t $(DURATION) -i $(COMPUTER) \
		-ss $(SPEAKER_START_TS) -t $(DURATION) -i $(SPEAKER) \
		-i $(BACKGROUND) \
		-loop 1 -t 3 -i $(INTRO) \
		-loop 1 -t 3 -i $(OUTTRO) \
		-f lavfi -t 3 -i anullsrc=channel_layout=1 -c:a aac \
		-filter_complex " \
			nullsrc=size=1920x1080 [base]; \
			[0:v] setpts=PTS-STARTPTS, crop=w=1440:h=1080:x=240:y=0, scale=1280x960 [laptop]; \
			[1:v] setpts=PTS-STARTPTS, scale=1280x720, crop=w=540:h=720:x=370:y=0 [speaker]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080 [background]; \
			[3:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[4:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[base][background] overlay=shortest=0 [base+background]; \
			[base+background][laptop] overlay=shortest=1:x=33:y=60 [background+laptop]; \
			[background+laptop][speaker] overlay=shortest=1:repeatlast=0:x=1343:y=60 [background+laptop+speaker]; \
			[background+laptop+speaker] fade=in:0:25, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[0:a] volume=15dB, afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[intro][5:a][vsession][asession][outtro][5:a] concat=n=3:v=1:a=1 \
		" \
		-c:v libx264 -preset slow -profile:v high -crf 18 -coder 1 -pix_fmt yuv420p \
		-movflags +faststart -g 30 -bf 2 \
		-c:a aac -b:a 128k -profile:a aac_low \
		-metadata album="Ch'ti JUG" \
		-metadata album_artist="Ch'ti JUG <team@chtijug.org>" \
		-metadata author="Ch'ti JUG <team@chtijug.org>" \
		-metadata comment="$(COMMENT)" \
		-metadata title="$(TITLE)" \
		-metadata title-eng="$(TITLE)" \
		-metadata year="$(YEAR)" \
		$@

clean:
	$(RM) $(OUTPUT)
