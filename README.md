# Aries — Deploy Configs

Production deployment configuration for [Aries](https://chat.aries.ai.id) on an Instabox VPS with Cloudflare Tunnel.

## Contents

| File | Purpose |
|------|---------|
| `docker-compose.yml` | API (Node) + MongoDB + Meilisearch stack |
| `aries.example.yaml` | App config template — custom endpoints & models |
| `DEPLOY-INSTABOX.md` | Full deploy runbook: build, atomic dist swap, restart, verify |
| `ttyd-start.sh` | Web terminal (ttyd) launcher — bound to 127.0.0.1, exposed via Cloudflare Tunnel with Basic auth |

## Architecture

- Browser → Cloudflare (HTTPS/WSS) → cloudflared tunnel → services on localhost
- Deploys are atomic: build → stage `dist-assets.new` → swap → restart → verify live bundle hash
- Secrets (`MEILI_MASTER_KEY`, `CREDS_KEY`, `CREDS_IV`) are redacted — set your own before deploying
