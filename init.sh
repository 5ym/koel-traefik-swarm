#!/bin/sh

mkdir -p koel/music koel/covers koel/search_index koel/db
curl https://raw.githubusercontent.com/5ym/koel-traefik-swarm/main/koel-compose.yml > koel-compose.yml
docker compose -f koel-compose.yml up -d db
docker compose run --rm koel php artisan koel:init --no-assets