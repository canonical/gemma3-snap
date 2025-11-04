#!/bin/bash -eu

engine="$(modelctl show-engine | yq .name)"
modelctl run "$SNAP/engines/$engine/server" --wait-for-components
