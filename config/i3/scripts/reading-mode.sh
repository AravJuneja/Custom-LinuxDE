#!/usr/bin/env bash
set -euo pipefail

state_file="/tmp/i3-reading-mode-enabled"
warm_gamma="1.0:0.7:0.5"
warm_brightness="0.82"
normal_gamma="1.0:1.0:1.0"
normal_brightness="1.0"

outputs="$(xrandr --query | awk '/ connected/{print $1}')"
if [ -z "${outputs}" ]; then
  exit 1
fi

if [ -f "${state_file}" ]; then
  for output in ${outputs}; do
    xrandr --output "${output}" --gamma "${normal_gamma}" --brightness "${normal_brightness}"
  done
  rm -f "${state_file}"
else
  for output in ${outputs}; do
    xrandr --output "${output}" --gamma "${warm_gamma}" --brightness "${warm_brightness}"
  done
  touch "${state_file}"
fi
