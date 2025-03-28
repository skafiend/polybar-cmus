#!/bin/bash

STOPPED=$(cmus-remote -C status | head -n 1 | cut -d ' ' -f 2)

if [[ $STOPPED == "stopped" ]]; then 
    echo ""
    exit
fi

DUR=$(cmus-remote -C status | grep "duration" | cut -f 2 -d ' ')
DUR_MIN=$(( $DUR / 60 ))
DUR_SEC=$(( $DUR % 60 ))

POS=$(cmus-remote -C status | grep "position" | cut -f 2 -d ' ')
POS_MIN=$(( $POS / 60 ))
POS_SEC=$(( $POS % 60 ))
DELIM="%%{F#f00}/%%{F-}"

TIME=$(printf "%02d:%02d %s %02d:%02d" $POS_MIN $POS_SEC $DELIM $DUR_MIN $DUR_SEC)

TITLE=$(cmus-remote -C status | grep "tag title" | cut -f 3- -d ' ')
ARTIST=$(cmus-remote -C status | grep "tag artist" | cut -f 3- -d ' ')

LABEL="$ARTIST - $TITLE"

if [ ${#LABEL} -gt 55 ]; then
    printf '%.55s' "$LABEL"
    printf "...%%{F#fff} $TIME %%{F#f00}|"
else
    printf "$LABEL"
    printf "%%{F#fff} $TIME %%{F#f00}|"
fi
