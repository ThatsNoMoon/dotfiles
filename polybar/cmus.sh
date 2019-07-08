#!/bin/bash

prepend_zero () {
        seq -f "%02g" $1 $1
}

status=$(cmus-remote -C status)

artist=$(echo -n $(echo "$status" | grep "tag artist" | cut -c 12-))

if [[ $artist = *[!\ ]* ]]; then
        song=$(echo -n $(echo "$status" | grep title | cut -c 11-))
        position=$(echo "$status" | grep position | cut -c 10-)
        minutes1=$(prepend_zero $(($position / 60)))
        seconds1=$(prepend_zero $(($position % 60)))
        duration=$(echo "$status" | grep duration | cut -c 10-)
        minutes2=$(prepend_zero $(($duration / 60)))
        seconds2=$(prepend_zero $(($duration % 60)))
        echo -n "$artist - $song [$minutes1:$seconds1/$minutes2:$seconds2]"
else
        echo
fi
