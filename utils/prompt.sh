#!/bin/bash

. $(pwd)/utils/styles.sh
. $(pwd)/helpers/print.sh
. $(pwd)/helpers/admin_access.sh

echo "UP will download binaries and configure this machine. Are you sure? ${font_highlight}(y/n)${font_reset}"
read START

if ! [[ $START =~ ^[Yy]$ ]]; then
    print_error "UP requires your consent beforehand; Exiting now. \n"
    exit 0
fi;

echo "UP requires Admin access. Are you sure? ${font_highlight}(y/n)${font_reset}"
read ADMIN_ACCESS

if [[ $ADMIN_ACCESS =~ ^[Yy]$ ]]; then
    admin_access
    else
    print_error "UP requires 'Admin Access' to be granted; Exiting now. \n"
    exit 0
fi;

echo "Would you like to watch a video while we run through the configuration? ${font_highlight}(y/n)${font_reset}"
read WATCH_VIDEO

if [[ $WATCH_VIDEO =~ ^[Yy]$ ]]; then
    open https://www.youtube.com/watch?v=SGyOaCXr8Lw;
fi;

sh $(pwd)/main.sh