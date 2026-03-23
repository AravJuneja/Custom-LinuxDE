#!/bin/sh
ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).num')
i3-input -P 'Workspace name: ' -F "rename workspace to \"$ws: %s\"" -l 50
