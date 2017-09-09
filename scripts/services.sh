#!/usr/bin/env bash

cloneAll() {
  clone "patternstack-node"
  clone "patternstack-ng"
  clone "patternstack-nginx"
}

clone() {
  local TARGET=$1
  if [ ! -d "services/${TARGET}" ]; then
    git clone git@github.com:bleathem/${TARGET}.git services/${TARGET}
  else
    echo "services/${TARGET} already exists"
  fi
}

pull() {
  git -C services/patternstack-node pull
  git -C services/patternstack-ng pull
  git -C services/patternstack-nginx pull
}

case $1 in
  clone)
  cloneAll "$@"
  ;;
  pull)
  pull "$@"
  ;;
  *)
  echo "Usage: services.sh {clone|pull}"
esac
