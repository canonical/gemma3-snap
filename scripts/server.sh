#!/bin/bash -eu

# Save the status for content sharing
# This must be done each time the server is started to expose the actual status
mkdir -p "$STATUS_SHARE"
modelctl status --wait-for-components --format=json > "$STATUS_SHARE/status.json"

engine="$(modelctl status --format=json | jq -r .engine)"
exec modelctl run "$SNAP/engines/$engine/server" --wait-for-components
