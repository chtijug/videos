TITLE             := Ch'ti JUG - Spring Boot: Chapitre 4
COMMENT           := Ch'ti JUG - Session Spring Boot présentée par Stéphane Nicoll le 18 décembre 2025 à EuraTechnologies
YEAR              := $(shell date "+%Y")
INPUT             := Rush/2025-12-18_18-45-47.mov
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := output.mp4
START_TS					:= 00:17:38.000
DURATION          := 4565# 01:33:43 - 00:17:38

ifeq "$(HW_ACCEL)" 'nvenc'
	VIDEO_CODEC := h264_nvenc
else ifeq "$(HW_ACCEL)" 'videotoolbox'
	VIDEO_CODEC := h264_videotoolbox
else
	VIDEO_CODEC := libx264
endif

# 0. empty sound [a]
# 1. intro loop [v]
# 2. outtro loop [v]
# 3. input [a+v]
$(OUTPUT): $(INTRO) $(INPUT) $(OUTTRO)
	ffmpeg -y \
		-f lavfi -t 3 -i anullsrc=channel_layout=1 \
		-loop 1 -t 3 -i "$(INTRO)" \
		-loop 1 -t 3 -i "$(OUTTRO)" \
		-ss "$(START_TS)" -t "$(DURATION)" -i "$(INPUT)" \
		-filter_complex " \
			[1:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[3:v] fade=in:0:25, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[3:a] volume=+30dB, afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[intro][0:a][vsession][asession][outtro][0:a] concat=n=3:v=1:a=1 \
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
