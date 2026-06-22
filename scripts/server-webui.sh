#!/bin/bash
set -euo pipefail

port="$(modelctl get webui.http.port)"
host="$(modelctl get webui.http.host)"

engine="$(modelctl status --format=json | jq -r .engine)"

# The capabilities depend on the engine size
# The xsmall (gemma3 270m) and small (gemma3 1b) are text-only.
suffix="${engine##*-}"
if [[ "$suffix" == "small" || "$suffix" == "xsmall" ]]; then
    capabilities="text, text:markdown"
else 
    capabilities="text, text:markdown, vision"
fi

exec modelctl serve-webui "$SNAP/webui" --port "$port" --host "$host" --capabilities "$capabilities"
