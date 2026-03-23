#!/bin/sh
i3-msg -t get_workspaces | jq -r '.[].name' | while read name; do
    num=$(echo "$name" | cut -d: -f1)
    i3-msg "rename workspace \"$name\" to \"$num\""
done
