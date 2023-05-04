#!/bin/bash

SRC_DIR="/path/to/source"
DEST_DIR="/path/to/destination"
# copy files to $HOME, create backup if files exist
for FILENAME in "${SRC_DIR}"/*; do
  BASENAME=$(basename "${FILENAME}")
  if [ -e "${DEST_DIR}/${BASENAME}" ]; then
    mv "${DEST_DIR}/${BASENAME}" "${DEST_DIR}/${BASENAME}_BACKUP123"
  fi
  cp "${FILENAME}" "${DEST_DIR}/${BASENAME}"
done

