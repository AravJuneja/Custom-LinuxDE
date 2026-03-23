#!/bin/sh
ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).num')
i3-msg "rename workspace to $ws"
