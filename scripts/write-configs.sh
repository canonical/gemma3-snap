#!/bin/bash -eu

# Wait for component before querying status
modelctl run true --wait-for-components
status_json=$(modelctl status --format=json)

# Simple dump of status command in json
mkdir -p "$STATUS_SHARE"
echo "$status_json" > "$STATUS_SHARE/status.json"

# OpenAI endpoint configuration in Open WebUI content sharing format
rm -f "$OWUI_SHARE/openai.json"
openai_url=$(echo "$status_json" | jq -r '.endpoints.openai // empty')
if [ -n "$openai_url" ]; then
  mkdir -p "$OWUI_SHARE"
  jq -n \
    --arg base_url "$openai_url" \
    '{
      "enable": true,
      "base_url": $base_url,
      "auth_type": "bearer",
      "api_key": "-",
      "tags": [],
      "prefix_id": "",
      "model_ids": [],
      "connection_type": "external"
    }' > "$OWUI_SHARE/openai.json"
fi
