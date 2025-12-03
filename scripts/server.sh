#!/bin/bash -eu

engine="$(modelctl show-engine --format=json | jq .name)"

modelctl run "$SNAP/engines/$engine/server" --wait-for-components
