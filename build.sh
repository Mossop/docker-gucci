#! /bin/sh

SOURCE=$1
TEMPLATE=$2
TARGET=$3

cd /templates

if [ ! -f "$SOURCE" ]; then
  echo "Source file '${SOURCE}' does not exist." >&2
  exit
fi

if [ ! -f "$TEMPLATE" ]; then
  echo "Template file '${TEMPLATE}' does not exist." >&2
  exit
fi

DIR=`dirname $TARGET`
if [ ! -d "$DIR" ]; then
  echo "Target parent directory does not exist." >&2
  exit
fi

/usr/local/bin/gucci -f $SOURCE $TEMPLATE > $TARGET
