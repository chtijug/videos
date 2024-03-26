TITLE             := Ch'ti JUG - 26 Juin 18 - Florent Ramière - Apache Kafka
COMMENT           := Ch'ti JUG - Session Apache Kafka présentée par Florent Ramière le 26 juin 2018 chez Norsys
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := output.mp4
DURATION          := 4135# 01:08:55
COMPUTER          := Rush/computer.mov
COMPUTER_START_TS := 00:12:51.500
SPEAKER           := Rush/speaker.mp4
SPEAKER_START_TS  := 00:00:00.000# Blank since 00:01:05 in computer timeline -> 00:11:46.500 duration (706.5 s)
BACKGROUND        := ../../background/background_screen_speaker.png
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
		-f lavfi -t 3 -i anullsrc=channel_layout=1 \
		-ss 00:01:05 -t 706.5 -i $(COMPUTER) \
		-filter_complex " \
			nullsrc=size=1920x1080 [base]; \
			[0:v] setpts=PTS-STARTPTS, scale=1280x720 [laptop]; \
			[1:v] setpts=PTS-STARTPTS, scale=1280x720, crop=w=540:h=720:x=370:y=0 [speaker]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080 [background]; \
			[3:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[4:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[base][background] overlay=shortest=0 [base+background]; \
			[base+background][laptop] overlay=shortest=1:x=33:y=180 [background+laptop]; \
			[background+laptop][speaker] overlay=shortest=1:repeatlast=0:x=1343:y=180 [background+laptop+speaker]; \
			[6:v] setpts=PTS-STARTPTS, fade=in:0:d=1, fade=out:st=704.5:d=1 [vprolog]; \
			[background+laptop+speaker] fade=in:0:25, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[0:a] volume=+12dB, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[6:a] volume=+12dB, afade=in:ss=0:d=1 [aprolog]; \
			[intro][5:a][vprolog][aprolog][vsession][asession][outtro][5:a] concat=n=4:v=1:a=1 \
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
