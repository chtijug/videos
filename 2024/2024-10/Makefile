TITLE             := Ch'ti JUG - Legal JVM Dopes For Your Apps
COMMENT           := Ch'ti JUG - Session présentée par Dmitri Chuyko le 14 octobre 2024 chez Zenika
INTRO             := ./Rush/intro.png
OUTTRO            := ./Rush/intro.png
OUTPUT            := video.mp4
SPEAKER           := ./Rush/2024-10-14_18-43-54.mkv
SPEAKER_START_TS  := 00:13:52.800
SPEAKER_STOP_TS   := 01:26:55.000
DURATION          := $(shell expr $$(TZ=UTC date -d '1970-01-01 $(SPEAKER_STOP_TS)' +%s) - $$(TZ=UTC date -d '1970-01-01 $(SPEAKER_START_TS)' +%s))
YEAR              := $(shell date "+%Y")

ifeq "$(HW_ACCEL)" 'nvenc'
	VIDEO_CODEC := h264_nvenc
else
	VIDEO_CODEC := libx264
endif

.PHONY: clean default

default: $(OUTPUT)

# 38: ... -coder 1
$(OUTPUT): $(INTRO) $(SPEAKER) $(OUTTRO)
	ffmpeg -y \
		-ss $(SPEAKER_START_TS) -to $(SPEAKER_STOP_TS) -i $(SPEAKER) \
		-loop 1 -t 3 -i $(INTRO) \
		-loop 1 -t 3 -i $(OUTTRO) \
		-f lavfi -t 3 -i anullsrc=channel_layout=1 \
		-filter_complex " \
			[0:v] setpts=PTS-STARTPTS [speaker]; \
			[1:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:30, fade=out:60:30 [intro]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:30, fade=out:60:30 [outtro]; \
			[speaker] fade=in:0:30, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[0:a] afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[intro][3:a][vsession][asession][outtro][3:a] concat=n=3:v=1:a=1 \
		" \
		-movflags +faststart \
		-vcodec $(VIDEO_CODEC) -preset slow -profile:v high -bf 2 -g 30 -crf 18 -pix_fmt yuv420p -r 30 -maxrate 2400k -rc-lookahead 30 \
		-acodec aac -b:a 128k -profile:a aac_low \
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
