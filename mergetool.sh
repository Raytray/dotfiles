#!/bin/sh
meld $2 $1 &
sleep 0.5
meld $1 $3 &
sleep 0.5
meld $2 $4 $3
