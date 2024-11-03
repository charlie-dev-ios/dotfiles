#!/bin/bash

# TrueColorが設定できているかテスト
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash

# FontFamilyが設定できているかテスト

# Regular
printf "\e[0mRegular\n"
# Bold
printf "\e[1mBold\e[0m\n"
# Italic
printf "\e[3mItalic\e[0m\n"
# Bold Italic
printf "\e[1;3mBold Italic\e[0m\n"
# Reset
printf "\e[0m\n"
