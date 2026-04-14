#!/bin/bash
set -euo pipefail

port="$(modelctl get webui.http.port)"
host="$(modelctl get webui.http.host)"

engine="$(modelctl status --wait-for-components --format=json | jq -r .engine)"

# The capabilities depend on the engine size
# The xsmall (gemma3 270m) and small (gemma3 1b) are text-only.
suffix="${engine##*-}"
if [[ "$suffix" == "small" || "$suffix" == "xsmall" ]]; then
    capabilities="text"
else 
    capabilities="text, vision"
fi

exec modelctl serve-ui "$SNAP/webui" --port "$port" --host "$host" --capabilities "$capabilities"
