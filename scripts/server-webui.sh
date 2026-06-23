#!/bin/bash
set -euo pipefail

port="$(modelctl get webui.http.port)"
host="$(modelctl get webui.http.host)"

model_name="$(modelctl show-model --format=json | jq -r .name)"

# The capabilities depend on the model
# gemma3 270m and 1b are text-only.
if [[ "$model_name" == 270m* || "$model_name" == 1b* ]]; then
    capabilities="text, text:markdown"
else 
    capabilities="text, text:markdown, vision"
fi

exec modelctl serve-webui "$SNAP/webui" --port "$port" --host "$host" --capabilities "$capabilities"
