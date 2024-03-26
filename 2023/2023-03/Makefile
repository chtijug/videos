TITLE             := Ch'ti JUG - Mon application Java sans serveur sur AWS
COMMENT           := Ch'ti JUG - Session présentée par Damien Metzler le 16 mars 2023 chez Euratechnologies
INTRO             := Rush/intro.png
OUTTRO            := Rush/intro.png
OUTPUT            := video.mp4
SPEAKER           := Rush/REC_3.mp4
SPEAKER_START_TS  := 00:02:00.000
SPEAKER_STOP_TS   := 01:28:10.000
DURATION          := $(shell expr $$(TZ=UTC date -d '1970-01-01 $(SPEAKER_STOP_TS)' +%s) - $$(TZ=UTC date -d '1970-01-01 $(SPEAKER_START_TS)' +%s))
YEAR              := $(shell date "+%Y")

ifeq "$(HW_ACCEL)" 'nvenc'
	VIDEO_CODEC := h264_nvenc
else
	VIDEO_CODEC := libx264
endif

.PHONY: clean default

default: $(OUTPUT)

$(OUTPUT): $(SPEAKER)
	ffmpeg -y \
		-ss $(SPEAKER_START_TS) -to $(SPEAKER_STOP_TS) -i $< \
		-loop 1 -t 3 -i $(INTRO) \
		-loop 1 -t 3 -i $(OUTTRO) \
		-f lavfi -t 3 -i anullsrc=channel_layout=1 \
		-filter_complex " \
			[0:v] setpts=PTS-STARTPTS [speaker]; \
			[1:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [intro]; \
			[2:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:25, fade=out:50:25 [outtro]; \
			[speaker] fade=in:0:25, fade=out:st=$(shell expr $(DURATION) - 2):d=1 [vsession]; \
			[0:a] pan=stereo|FL<FL|FR<FL, afade=in:ss=0:d=1, volume=+20dB, afade=out:st=$(shell expr $(DURATION) - 2):d=1 [asession]; \
			[intro][3:a][vsession][asession][outtro][3:a] concat=n=3:v=1:a=1 \
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
