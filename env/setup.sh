#!/bin/zsh

set -Ceu
cd $(dirname $0)

ENV_DIR="$HOME/.config/env"
if ! [ -d $ENV_DIR ]; then
    mkdir $ENV_DIR
fi

FILES=(.github_token)
for FILE in $FILES; do
    if ! [ -s $FILE ]; then
        echo "🚨No such file or empty file: ${PWD}/${FILE}"
        exit 1
    fi
    ln -snfv ${PWD}/$FILE $ENV_DIR/$FILE
done
