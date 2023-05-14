#!/bin/bash

err() {
  echo "$*" >&2
}

if [[ -z "$1" ]]; then
  err "Song pack not specifed"
  err "Usage: $0 <OutFox.Serenity.*.zip>"
  exit 1
fi

INSTALL_DIR=/usr/share/outfox/Songs

dir=$(dirname "$0")

if [[ ! -d "${INSTALL_DIR}" ]]; then
  err "${INSTALL_DIR} does not exist, have you installed OutFox?"
  err "See ${dir}/install.sh"
  exit 1
fi

sudo unzip "$1" -d "${INSTALL_DIR}"

