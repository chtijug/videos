OPERATING_SYSTEM  := $(shell uname -s)
TITLE             := Ch'ti JUG - Build an AI-Infused ChatBot using LangChain4J
COMMENT           := Ch'ti JUG - Session LangChain4J présentée par Antonio Goncalves le 20 janvier 2026 chez Zenika Lille
YEAR              := $(shell date "+%Y")
INPUT             := Rush/2026-01-20_18-42-45.mkv
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := output.mp4
START_TS					:= 00:18:17
STOP_TS           := 02:01:15
ifeq ($(OPERATING_SYSTEM), Darwin)
	START_SEC       := $(shell date -j -f '%Y-%m-%d %H:%M:%S%z' '1970-01-01 $(START_TS)+0000' '+%s')
	STOP_SEC        := $(shell date -j -f '%Y-%m-%d %H:%M:%S%z' '1970-01-01 $(STOP_TS)+0000'  '+%s')
endif
ifeq ($(OPERATING_SYSTEM), Linux)
	START_SEC       := $(shell date -d'1970-01-01 $(START_TS)' '+%s')
	STOP_SEC        := $(shell date -d'1970-01-01 $(STOP_TS)'  '+%s')
endif
DURATION_SEC      := $(shell expr $(STOP_SEC) - $(START_SEC))

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
		-ss "$(START_TS)" -t "$(DURATION_SEC)" -i "$(INPUT)" \
		-filter_complex " \
			[1:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[3:v] fade=in:0:25, fade=out:st=$(shell expr $(DURATION_SEC) - 2):d=1 [vsession]; \
			[3:a] volume=+20dB, afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION_SEC) - 2):d=1 [asession]; \
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
