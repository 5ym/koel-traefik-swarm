#!/bin/sh

mkdir -p koel/music koel/covers koel/search_index koel/db
curl https://raw.githubusercontent.com/5ym/koel-traefik-swarm/main/koel-compose.yml > koel-compose.yml
docker compose -f koel-compose.yml up -d db
docker compose -f koel-compose.yml run --rm koel php artisan koel:init --no-assets
docker compose down
docker stack deploy --with-registry-auth -c koel-compose.yml koel