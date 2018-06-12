#!/bin/bash -e

# create folder if not exists.
# $1: folder name
function create_folder() {
  if [ ! -d "$1" ]; then
    mkdir "$1"
  fi
}

# merge files into 'dist' folder.
# $1: target folder 1
# $2: target folder 2
function merge_files() {
  create_folder "dist"
  cp -r "$1"/* "$2"/* "dist"
}

# packing zip to 'release' folder and clean up 'dist' folder.
# $1: dist folder
# $2: dist file name
function packing_zip() {
  create_folder "release"
  cd "dist"
  zip -1 -q -r "../release/$1" .
  cd ..
  rm -r "dist"
}

# API27, ARMv7a, 480DPI
merge_files "src/common/" "src/api-27_armv7a_480dpi/"
packing_zip "gapps_api-27_armv7a_480dpi.zip"
