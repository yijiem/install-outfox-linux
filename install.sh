#!/bin/bash -e

err() {
  echo "$*" >&2
}

if [[ -z "$1" ]]; then
  err "OutFox tarball not specifed"
  err "Usage: $@ <OutFox-*.tar.gz>"
  exit 1
fi

INSTALL_DIR=/usr/share/outfox
DESKTOP_FILE=/usr/share/applications/outfox.desktop

dir=$(dirname "$0")

if [[ -d "${INSTALL_DIR}" ]] && [[ ! -z $(ls -A "${INSTALL_DIR}") ]]; then
  echo "${INSTALL_DIR} exists and is not empty."
  read -p "Continue would remove its existing content [y/n] " response
  if [[ "${response}" == "n" ]]; then
    exit 0
  fi
  sudo rm -r "${INSTALL_DIR}"
fi

sudo mkdir "${INSTALL_DIR}"
sudo tar -xvf "$1" -C "${INSTALL_DIR}" --strip-components=1 --no-same-owner

sudo cp "${dir}"/{outfox.desktop,outfox.png} "${INSTALL_DIR}/"
sudo chmod o+r "${INSTALL_DIR}"/{outfox.desktop,outfox.png}
sudo ln -fs ../outfox/outfox.desktop "${DESKTOP_FILE}"

xdg-desktop-menu forceupdate

