#! /usr/bin/env bash

# set -x

declare -r TITLE="Ch'ti JUG - L’architecture Micro-Front, un levier pour la webperf ?"
declare -r COMMENT="Ch'ti JUG - L’architecture Micro-Front, un levier pour la webperf ? présentée par Bertrand Laot et Ludovic Lagatie le 07 octobre 2022 chez Adeo"
declare -r INTRO="Rush/intro.png"
declare -r OUTTRO="Rush/intro.png"
declare -r OUTPUT="output.mp4"
declare -r INPUT="Rush/2022-10-06 18-30-49.mkv"
declare -r INPUT_START_TS="00:21:19"
declare -r INPUT_STOP_TS="01:44:43"
declare YEAR
YEAR="$(date "+%Y")"
readonly YEAR

if [ "${HW_ACCEL}" = "nvenc" ]; then
  VIDEO_CODEC="h264_nvenc"
else
  VIDEO_CODEC="libx264"
fi
readonly VIDEO_CODEC

function ts_2_sec() {
  IFS=: read -r hour minute second <<< "$1"
  printf "%s" "$(((hour * 60 + minute) * 60 + second))"
}

declare -i INPUT_START_SEC
INPUT_START_SEC=$(ts_2_sec ${INPUT_START_TS})
readonly INPUT_START_SEC
declare -i INPUT_STOP_SEC
INPUT_STOP_SEC=$(ts_2_sec ${INPUT_STOP_TS})
readonly INPUT_STOP_SEC

# test -f shrinked.mp4 \
#   || ffmpeg -y \
#        -ss "${INPUT_START_TS}" -to "${INPUT_STOP_TS}" -i "${INPUT}" \
#        -c copy \
#        shrinked.mp4

test -f "${OUTPUT}" \
  && rm "${OUTPUT}"

ffmpeg -y \
  -ss "${INPUT_START_TS}" -to "${INPUT_STOP_TS}" -i "${INPUT}" \
  -loop 1 -t 3 -framerate 60 -i "${INTRO}" \
  -loop 1 -t 3 -framerate 60 -i "${OUTTRO}" \
  -f lavfi -t 3 -i anullsrc=channel_layout=2 \
  -filter_complex "\
    [0:v] crop=1780:32:110:45,boxblur=5:enable='if(\
         between(t,$(ts_2_sec "00:23:12"),$(ts_2_sec "00:24:39"))\
        +between(t,$(ts_2_sec "00:26:31"),$(ts_2_sec "00:28:21"))\
        +between(t,$(ts_2_sec "00:30:17"),$(ts_2_sec "00:31:58"))\
        +between(t,$(ts_2_sec "00:44:20"),$(ts_2_sec "00:47:12"))\
        +between(t,$(ts_2_sec "01:02:53"),$(ts_2_sec "01:03:10"))\
        +between(t,$(ts_2_sec "01:04:16"),$(ts_2_sec "01:06:17"))\
        ,1,0)' [mask1]; \
    [0:v] crop=1185:20:110:210,boxblur=5:enable='if(\
         between(t,$(ts_2_sec "01:02:49"),$(ts_2_sec "01:02:53"))\
        ,1,0)' [mask2]; \
    [0:v][mask1] overlay=110:45 [masked1]; \
    [masked1][mask2] overlay=110:210 [vsession]; \
    [0:a] afade=in:ss=0:d=1, volume=+10dB, afade=out:st=$(( INPUT_STOP_SEC - INPUT_START_SEC - 1 )):d=1 [asession]; \
    [1:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:60, fade=out:120:60 [intro]; \
    [2:v] setpts=PTS-STARTPTS, scale=1920x1080, fade=in:0:60, fade=out:120:60 [outtro]; \
    [intro][3:a][vsession][asession][outtro][3:a] concat=n=3:v=1:a=1 [voutput][aoutput] \
  " \
  -map "[voutput]" \
  -map "[aoutput]" \
  -vcodec "${VIDEO_CODEC}" -preset slow -profile:v high -crf 18 -coder 1 -pix_fmt yuv420p \
  -movflags +faststart -g 30 -bf 2 \
  -acodec aac -ar 48000 -b:a 192k -profile:a aac_low \
  -metadata album="Ch'ti JUG" \
  -metadata album_artist="Ch'ti JUG <team@chtijug.org>" \
  -metadata author="Ch'ti JUG <team@chtijug.org>" \
  -metadata comment="${COMMENT}" \
  -metadata title="${TITLE}" \
  -metadata title-eng="${TITLE}" \
  -metadata year="${YEAR}" \
  "${OUTPUT}"
