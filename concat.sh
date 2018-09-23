#!/bin/bash

TARGET=${1:-speaker}

case $TARGET in
    speaker)
        rm ${TARGET}.txt || true
        for part in `ls -1 PIC*.MP4`; do
            echo "file '$part'" >> ${TARGET}.txt
        done
        ffmpeg -f concat -safe 0 -i ${TARGET}.txt -c copy ${TARGET}.mp4
        ;;
    computer)
        rm ${TARGET}.txt || true
        for part in `ls -1 VGA_*.mov`; do
            echo "file '$part'" >> ${TARGET}.txt
        done
        ffmpeg -f concat -safe 0 -i ${TARGET}.txt -c copy ${TARGET}.mp4
        ;;
    *)
        exit 1
        ;;
esac
