#!/usr/bin/env bash

set -euo pipefail

# Check arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

FILE="$1"

# Check file exists
if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found."
  exit 1
fi

# Require TOKEN env variable
if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "Error: Please set your GitHub TOKEN environment variable."
  exit 1
fi

# Encode file content as JSON string
CONTENT=$(python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))' < "$FILE")

# Create gist
curl -sL \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -d @- https://api.github.com/gists <<EOF
{
  "description": "Gist created from terminal",
  "public": false,
  "files": {
    "$FILE": {
      "content": $CONTENT
    }
  }
}
EOF
