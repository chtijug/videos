TITLE             := Ch'ti JUG - Docker, Kubernetes et Istio, c'est utile pour mon monolithe?
COMMENT           := Ch'ti JUG - Session Docker, Kubernetes et Istio présentée par David Gageot le 16 avril 2018 chez Adeo
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := output.mp4
DURATION          := 4460# 01:14:20
COMPUTER          := Rush/computer.mov
COMPUTER_START_TS := 00:00:15.773
SPEAKER           := Rush/speaker.mp4
SPEAKER_START_TS  := 00:00:16.603
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
		-f lavfi -t 3 -i anullsrc=channel_layout=1 -c:a aac \
		-filter_complex " \
			nullsrc=size=1920x1080 [base]; \
			[0:v] setpts=PTS-STARTPTS, scale=1280x720 [laptop]; \
			[1:v] setpts=PTS-STARTPTS, scale=1280x720, crop=w=540:h=720:x=370:y=0, eq=brightness=0.1 [speaker]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080 [background]; \
			[3:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[4:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[base][background] overlay=shortest=0 [base+background]; \
			[base+background][laptop] overlay=shortest=1:x=33:y=180 [background+laptop]; \
			[background+laptop][speaker] overlay=shortest=1:repeatlast=0:x=1343:y=180 [background+laptop+speaker]; \
			[background+laptop+speaker] fade=in:0:25, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[0:a] afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
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
