#!/usr/bin/env bash

if [ "$1" == "--debug" ]
  then set -x; fi
set -o errexit
set -o nounset
set -o pipefail

EXEC_NAME="$(basename "$(realpath "$0")")"
readonly EXEC_NAME

declare OUTPUT=out.mp4
declare INPUT
declare START_TS
declare STOP_TS
declare AUDIO_FILTER="volume=+30dB"

# Display in-line documentation and exit program
#
# $1 - exit code when exiting program
# $2 - Additional message to send to the user
function usage() {
  local -r EXIT_CODE=$1
  local -r MESSAGE=${2:-}

  cat 2>&1 <<EOF
  $EXEC_NAME - Process captation video before uploading to streaming platform

SYNOPSIS
  $EXEC_NAME [ OPTION | ... ]

USAGE
  $EXEC_NAME --in input.mov --from "00:12:34" --to "01:23:45" --out output.mp4

OPTIONS
  --in <INPUT_FILE>
    The file to process.

  --out <OUTPUT_FILE>
    (Optional, defaults to "${OUTPUT}") The target file to process, the input file is kept intact.

  --from <TIMESTAMP>
    The starting point in the input file timeline.

  --to <TIMESTAMP>
    The ending point in the input file timeline.

  --audio-filter <AUDIO_FILTER>
    (Optional, defaults to "${AUDIO_FILTER}") The audio filter argument to pass to FFMpeg for audio processing.

  --help, -h
    (Optional) Display the inline documentation, then exit with success

  --debug
    (Optional) Run the script in debug mode

ENVIRONMENT
  Environment variables

$MESSAGE
EOF
  exit "$EXIT_CODE"
}

while [[ $# -gt 0 ]]; do
  case $1 in
    --help|-h) usage 0
      ;;
    --debug)
      # shellcheck disable=SC2034 # this can be useful but not necessary used 🙂
      DEBUG_MODE_ENABLED="true"
      set -x
      ;;

    --in)
      shift
      INPUT=$1
      readonly INPUT
      ;;

    --out)
      shift
      OUTPUT=$1
      readonly OUTPUT
      ;;

    --from)
      shift
      START_TS=$1
      readonly START_TS
      ;;

    --to)
      shift
      STOP_TS=$1
      readonly STOP_TS
      ;;

    --audio-filter)
      shift
      AUDIO_FILTER=$1
      readonly AUDIO_FILTER
      ;;

    -*) usage 1 "Unknown options $1"
      ;;
    *) break
      ;;
  esac
  shift
done

test -z "${INPUT:-}" \
  && usage 1 "Missing input file path"
readonly INPUT

test -z "${OUTPUT:-}" \
  && usage 1 "Missing output file path"
readonly OUTPUT

test -z "${START_TS:-}" \
  && usage 1 "Missing starting timestamp"
readonly START_TS

test -z "${STOP_TS:-}" \
  && usage 1 "Missing ending timestamp"
readonly STOP_TS

test -z "${AUDIO_FILTER:-}" \
  && usage 1 "Missing audio filter command"
readonly AUDIO_FILTER

ffmpeg -y \
  -ss "${START_TS}" \
  -to "${STOP_TS}" \
  -i "${INPUT}" \
  -af "${AUDIO_FILTER}" \
  -codec:v copy \
  -codec:a aac -b:a 128k -profile:a aac_low \
  "${OUTPUT}"
