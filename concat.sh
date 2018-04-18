#!/bin/bash

TARGET=${1:-speaker}

rm ${TARGET}.txt || true
for part in `ls -1 PIC*.MP4`; do
    echo "file '$part'" >> ${TARGET}.txt
done
ffmpeg -f concat -safe 0 -i ${TARGET}.txt -c copy ${TARGET}.mp4
