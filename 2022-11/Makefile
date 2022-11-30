TITLE             := Ch'ti JUG - Gravitee : From developers to entrepreneurs
COMMENT           := Ch'ti JUG - Session présentée par Nicolas Géraud et David Brassely le 29 novembre 2022 à Euratechnologies
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := video.mp4
DURATION          := 5878# 01:37:58
SPEAKER           := Rush/euratech_29.11.mp4
SPEAKER_START_TS  := 00:00:03.500
YEAR              := $(shell date "+%Y")

ifeq "$(HW_ACCEL)" 'nvenc'
	VIDEO_CODEC := h264_nvenc
else
	VIDEO_CODEC := libx264
endif

.PHONY: clean default

default: $(OUTPUT)

$(OUTPUT): $(SPEAKER) $(INTRO) $(OUTTRO)
	ffmpeg -y \
		-ss $(SPEAKER_START_TS) -t $(DURATION) -i $(SPEAKER) \
		-loop 1 -t 3 -i $(INTRO) \
		-loop 1 -t 3 -i $(OUTTRO) \
		-f lavfi -t 3 -i anullsrc=channel_layout=1 -c:a aac \
		-filter_complex " \
			[0:v] setpts=PTS-STARTPTS [speaker]; \
			[1:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[speaker] fade=in:0:25, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[0:a] afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[intro][3:a][vsession][asession][outtro][3:a] concat=n=3:v=1:a=1 \
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
