#!/bin/bash

set -euo pipefail

# Export the configuration for content sharing
# This must be done each time the server is started to expose the actual configuration
$SNAP/bin/export-shared-configs.sh

engine="$(modelctl status --wait-for-components --format=json | jq -r .engine)"
exec modelctl run -- "$SNAP/engines/$engine/server" "$@"
