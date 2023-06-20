#!/bin/bash

err() {
  echo "$*" >&2
}

INSTALL_DIR=/usr/share/outfox/Appearance/Themes

if [[ -z "$1" ]]; then
  err "Theme folder not specifed"
  err "Usage: $0 <~/project/Infinitesimal>"
  exit 1
fi

sudo cp -r "$1" "${INSTALL_DIR}/"
sudo chmod -R o+rx "${INSTALL_DIR}/$(basename $1)"

