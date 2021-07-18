#!/bin/bash -e

# create folder if not exists.
function create_folder() {
  if [ ! -d "$1" ]; then
    mkdir "$1"
  fi
}

# merge files into 'dist' folder.
function merge_files() {
  create_folder "dist"
  cp -r $@ "dist"
}

# packing zip to 'release' folder and clean up 'dist' folder.
function packing_zip() {
  create_folder "release"
  cd "dist"
  zip -1 -q -r "../release/$1" .
  cd ..
  rm -r "dist"
}

# android 11
merge_files "src/commons/api-30/*" "src/apps/api-30/*" "src/frameworks/api-30/*"
packing_zip "gapps-android-11.zip"
