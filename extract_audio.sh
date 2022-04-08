#!/usr/bin/env bash

TARGET=${1:-speaker}

usage() {
    local NAME=$(basename $0)
    cat >&1 <<!
NAME
  $NAME - audio track extraction tool

SYNOPSIS
  $NAME [speaker|computer]

DESCRIPTION
  Run $NAME in the Rush directory, and ... that's it ;)
!
}

if [ "$#" -ne 1 ]; then
    usage
    exit 0;
fi

ffmpeg -i ${TARGET}.mp4 -vn -acodec copy ${TARGET}.aac
