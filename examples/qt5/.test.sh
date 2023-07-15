#!/bin/sh
set -ex

qmake example.pro
make

export QT_QPA_PLATFORM=offscreen # Don't draw anything on screen
export SHOULD_QUIT=1 # Quit immediately after showing the window
./example
