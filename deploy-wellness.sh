#!/usr/bin/env bash
set -euo pipefail

VPS_HOST="${VPS_HOST:-82.221.139.21}"
VPS_USER="${VPS_USER:-root}"
VPS_PORT="${VPS_PORT:-22}"
VPS_PATH="${VPS_PATH:-/var/www/puretidewellness}"
PM2_APP="${PM2_APP:-puretidewellness}"
PORT="${PORT:-3002}"

SSH_TARGET="${VPS_USER}@${VPS_HOST}"
SSH="ssh -p ${VPS_PORT}"
RSYNC_SSH="ssh -p ${VPS_PORT}"

npm ci
npm run build

rsync -avz -e "${RSYNC_SSH}" .next/standalone/ "${SSH_TARGET}:${VPS_PATH}/.next/standalone/"
rsync -avz -e "${RSYNC_SSH}" .next/static/ "${SSH_TARGET}:${VPS_PATH}/.next/static/"
rsync -avz -e "${RSYNC_SSH}" public/ "${SSH_TARGET}:${VPS_PATH}/public/"
rsync -avz -e "${RSYNC_SSH}" package.json package-lock.json "${SSH_TARGET}:${VPS_PATH}/"

${SSH} "${SSH_TARGET}" "set -euo pipefail; cd '${VPS_PATH}'; rm -rf .next/standalone/.next/static; mkdir -p .next/standalone/.next; cp -R .next/static .next/standalone/.next/static; rm -rf .next/standalone/public; cp -R public .next/standalone/public; npm install --omit=dev --no-audit --no-fund; PORT='${PORT}' HOSTNAME=0.0.0.0 pm2 restart '${PM2_APP}' --update-env || PORT='${PORT}' HOSTNAME=0.0.0.0 pm2 start .next/standalone/server.js --name '${PM2_APP}' --update-env"

curl -fsS -o /dev/null -I "https://puretidewellness.com/"
echo "OK"
