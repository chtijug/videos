TITLE             := Ch'ti JUG - Rust: Sûr et Conccurrent. Mais Comment Fait-il ?
COMMENT           := Ch'ti JUG - Session Rust présentée par Benjamin Coenen le 26 Septembre 2025 chez Purse
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := output.mp4
DURATION          := 5133# 01:25:33
COMPUTER          := Rush/laptop.mov
COMPUTER_START_TS := 00:00:05.500
SPEAKER           := Rush/speaker.mp4
SPEAKER_START_TS  := 00:14:27.000
AUDIO             := Rush/audio.wav# cleaned audio via Audacity (noise reduction + boost +20dB)
AUDIO_START_TS    := 00:14:27.000
BACKGROUND        := ../../background/background_speaker_screen_16_9.png
YEAR              := $(shell date "+%Y")

ifeq "$(HW_ACCEL)" 'nvenc'
	VIDEO_CODEC := h264_nvenc
else
	VIDEO_CODEC := libx264
endif

.PHONY: clean default

default: $(OUTPUT)

$(OUTPUT): $(COMPUTER) $(SPEAKER) $(AUDIO) $(BACKGROUND) $(INTRO) $(OUTTRO)
	ffmpeg -y \
		-ss "$(COMPUTER_START_TS)" -t "$(DURATION)" -i "$(COMPUTER)" \
		-ss "$(SPEAKER_START_TS)" -t "$(DURATION)" -i "$(SPEAKER)" \
		-i "$(BACKGROUND)" \
		-loop 1 -t 3 -i "$(INTRO)" \
		-loop 1 -t 3 -i "$(OUTTRO)" \
		-f lavfi -t 3 -i anullsrc=channel_layout=1 \
		-ss "$(AUDIO_START_TS)" -t "$(DURATION)" -i "$(AUDIO)" \
		-filter_complex " \
			nullsrc=size=1920x1080 [base]; \
			[0:v] setpts=PTS-STARTPTS, scale=1280x720 [laptop]; \
			[1:v] setpts=PTS-STARTPTS, scale=1280x720, crop=w=540:h=720:x=370:y=0 [speaker]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080 [background]; \
			[3:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[4:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[base][background] overlay=shortest=0 [base+background]; \
			[base+background][laptop] overlay=shortest=1:x=603:y=180 [background+laptop]; \
			[background+laptop][speaker] overlay=shortest=1:repeatlast=0:x=33:y=180 [background+laptop+speaker]; \
			[background+laptop+speaker] fade=in:0:25, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[6:a] afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
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
