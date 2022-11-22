#! /bin/sh

build() {
  echo Rebuilding...
  cat /templates/templates.json | jq --raw-output '.[] | .source + " " + .template + " " + .target' | xargs -r -n 3 /build.sh
}

build
while inotifywait -e modify -e delete -e create -e move -r /templates >/dev/null; do
  build
done
