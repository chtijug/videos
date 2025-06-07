TITLE             := Ch'ti JUG - The Reputation Formula: Turbocharge Your Developer Career
COMMENT           := Ch'ti JUG - Lecture about how to optimize your career by Bruno Souza on 2nd of June 2025 at Zenika Lille
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := output.mkv
DURATION          := 6499# 01:48:19.000
SPEAKER           := Rush/GMT20250602-170316_Recording_640x360.mp4
SPEAKER_START_TS  := 00:05:28# 01:53:47
YEAR              := $(shell date "+%Y")

ifeq "$(HW_ACCEL)" 'nvenc'
	VIDEO_CODEC := h264_nvenc
else
	VIDEO_CODEC := libx264
endif

.PHONY: clean default

default: $(OUTPUT)


# [base][speaker] overlay=shortest=1:x=0:y=60 [base+speaker]; \

$(OUTPUT): $(SPEAKER) $(INTRO) $(OUTTRO)
	ffmpeg -y \
		-ss $(SPEAKER_START_TS) -t $(DURATION) -i $(SPEAKER) \
		-loop 1 -t 3 -i $(INTRO) \
		-loop 1 -t 3 -i $(OUTTRO) \
		-f lavfi -t 3 -i anullsrc=channel_layout=1 \
		-filter_complex " \
			[0:v] setpts=PTS-STARTPTS, crop=w=640:h=320:x=0:y=0 [vin]; \
			[vin] pad=w=640:h=360:x=0:y=20 [speaker]; \
			[speaker] fade=in:0:25, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[1:v] setpts=PTS-STARTPTS, scale=640x360, fade=in:0:25, fade=out:50:25 [intro]; \
			[2:v] setpts=PTS-STARTPTS, scale=640x360, fade=in:0:25, fade=out:50:25 [outtro]; \
			[0:a] afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[intro][3:a][vsession][asession][outtro][3:a] concat=n=3:v=1:a=1 [session] \
		" \
		-c:v $(VIDEO_CODEC) -preset slow -profile:v high -qp 18 -coder 1 -pix_fmt yuv420p \
		-movflags +faststart -g 30 -bf 2 \
		-c:a aac -b:a 128k -profile:a aac_low \
		-metadata album="Ch'ti JUG" \
		-metadata album_artist="Ch'ti JUG <team@chtijug.org>" \
		-metadata author="Ch'ti JUG <team@chtijug.org>" \
		-metadata comment="$(COMMENT)" \
		-metadata title="$(TITLE)" \
		-metadata title-eng="$(TITLE)" \
		-metadata year="$(YEAR)" \
		-map '[session]' -sn \
		$@

clean:
	$(RM) $(OUTPUT)
