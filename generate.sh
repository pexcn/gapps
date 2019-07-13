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

# API-25, ARMv7a, 480DPI
merge_files "src/commons/*" "src/apps/commons/*" "src/apps/api-25/commons/*" "src/apps/api-25/arm-v7a/480dpi/*" "src/frameworks/api-25/*"
packing_zip "gapps_api25_armv7a_480dpi.zip"

# API-27, ARMv7a, 480DPI
merge_files "src/commons/*" "src/apps/commons/*" "src/apps/api-27/commons/*" "src/apps/api-27/arm-v7a/480dpi/*" "src/frameworks/api-27/*"
packing_zip "gapps_api27_armv7a_480dpi.zip"
