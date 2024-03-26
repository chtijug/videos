TITLE             := Ch'ti JUG - CQRS CQFD
COMMENT           := Ch'ti JUG - Session présentée par Delphin Aubin & Roman Acevedo le 23 janvier 2024 chez Zenika Lille
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := video.mp4
SPEAKER           := Rush/2024-01-23_18-46-20.mkv
SPEAKER_START_TS  := 00:15:12.000
SPEAKER_PAUSE_TS  := 00:17:46.000
SPEAKER_RESUME_TS := 00:18:41.000
SPEAKER_STOP_TS   := 01:03:55.000
DURATION1         := $(shell expr $$(TZ=UTC date -d '1970-01-01 $(SPEAKER_PAUSE_TS)' +%s) - $$(TZ=UTC date -d '1970-01-01 $(SPEAKER_START_TS)' +%s))
DURATION2         := $(shell expr $$(TZ=UTC date -d '1970-01-01 $(SPEAKER_STOP_TS)' +%s) - $$(TZ=UTC date -d '1970-01-01 $(SPEAKER_RESUME_TS)' +%s))
MOVIE             := Rush/Le_Jira_de_wall_street.mp4
YEAR              := $(shell date "+%Y")

ifeq "$(HW_ACCEL)" 'nvenc'
	VIDEO_CODEC := h264_nvenc
else
	VIDEO_CODEC := libx264
endif

.PHONY: clean default

default: $(OUTPUT)

$(OUTPUT): $(SPEAKER) $(MOVIE)
	ffmpeg -y \
		-loop 1 -t 3 -i $(INTRO) \
		-loop 1 -t 3 -i $(OUTTRO) \
		-f lavfi -t 3 -i anullsrc=channel_layout=1 \
		-ss $(SPEAKER_START_TS) -to $(SPEAKER_PAUSE_TS) -i $(SPEAKER) \
		-ss $(SPEAKER_RESUME_TS) -to $(SPEAKER_STOP_TS) -i $(SPEAKER) \
		-i $(MOVIE) \
		-filter_complex " \
			[0:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[1:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[3:v] setpts=PTS-STARTPTS, fade=in:0:25, fade=out:st=$(shell expr $(DURATION1) - 2):d=1 [vspeaker_part1]; \
			[3:a] afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION1) - 2):d=1 [aspeaker_part1]; \
			[4:v] setpts=PTS-STARTPTS, fade=in:0:25, fade=out:st=$(shell expr $(DURATION2) - 2):d=1 [vspeaker_part2]; \
			[4:a] afade=in:ss=0:d=1, afade=out:st=$(shell expr $(DURATION2) - 2):d=1 [aspeaker_part2]; \
			[5:v] scale=1920x1080 [movie]; \
			[intro][2:a][vspeaker_part1][aspeaker_part1][movie][5:a][vspeaker_part2][aspeaker_part2][outtro][2:a] concat=n=5:v=1:a=1 \
		" \
		-vcodec $(VIDEO_CODEC) -preset slow -profile:v high -crf 18 -coder 1 -pix_fmt yuv420p -r 25 -maxrate 1300k -rc-lookahead 25 \
		-movflags +faststart -g 30 -bf 2 \
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
