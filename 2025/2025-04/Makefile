TITLE             := Ch'ti JUG - Ce que Java nous réserve encore après 30 ans
COMMENT           := Ch'ti JUG - Session présentée par Guillaume Dufrêne le 9 avril 2025 à AXA
INTRO             := ./Rush/intro.png
OUTTRO            := ./Rush/intro.png
OUTPUT            := video.mp4
BACKGROUND        := ../../background/background_screen_16_9_speaker.png
COMPUTER          := ./Rush/2025-04-09_18-42-38.mkv
COMPUTER_START_TS := 00:20:18.000
COMPUTER_STOP_TS  := 01:44:32.000
DURATION          := $(shell expr $$(TZ=UTC date -d '1970-01-01 $(COMPUTER_STOP_TS)' +%s) - $$(TZ=UTC date -d '1970-01-01 $(COMPUTER_START_TS)' +%s))
SPEAKER           := ./Rush/shoot.mp4
SPEAKER_START_TS  := 00:18:45.300
YEAR              := $(shell date "+%Y")

ifeq "$(HW_ACCEL)" 'nvenc'
	VIDEO_CODEC := h264_nvenc
else
	VIDEO_CODEC := libx264
endif

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
			[0:a] afade=in:ss=0:d=1, volume=+30dB, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[intro][5:a][vsession][asession][outtro][5:a] concat=n=3:v=1:a=1 \
		" \
		-c:v $(VIDEO_CODEC) -preset slow -profile:v high -crf 18 -coder 1 -pix_fmt yuv420p \
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
