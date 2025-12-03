#!/bin/bash -eu

engine="$(modelctl show-engine --format=json | jq .name)"

# Save the status for content sharing
# This must be done each time the server is started to expose the actual status
mkdir -p "$STATUS_SHARE"
modelctl status --format=json > "$STATUS_SHARE/status.json"

modelctl run "$SNAP/engines/$engine/server" --wait-for-components
