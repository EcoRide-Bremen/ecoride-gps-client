#!/bin/bash
# Build-Skript für Cloudflare Pages
# Keys werden als Umgebungsvariablen gesetzt:
#   MAPBOX_TOKEN
#   SUPABASE_ANON_KEY
# Die Supabase-URL ist öffentlich und fest eingebaut.

set -e

cp index.html index.out.html

sed -i \
  -e "s|MAPBOX_TOKEN_PLACEHOLDER|${MAPBOX_TOKEN}|g" \
  -e "s|SUPABASE_KEY_PLACEHOLDER|${SUPABASE_ANON_KEY}|g" \
  index.out.html

mv index.out.html index.html

echo "✅ Build fertig – Keys injiziert."
