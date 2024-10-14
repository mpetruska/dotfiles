#!/usr/bin/env bash

SOURCE_DIR=$(pwd)

pushd $HOME

for file in $(find $SOURCE_DIR \
                   -type f \
                   -not -path "*/*~" \
                   -not -path "*/.git/*" \
                   -not -path "*/.gitignore" \
                   -not -path "*/.ssh/config_local" \
                   -not -path "*/install.sh" \
do
  TARGET=$(realpath --relative-base="$SOURCE_DIR" "$file")
  mkdir -p "$(dirname "$TARGET")"
  ln -s -v "$file" $TARGET
done

cp -n -v $SOURCE_DIR/.ssh/config_local .ssh/

popd
