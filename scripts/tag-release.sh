#!/usr/bin/env bash
# tag-release.sh — x402-avalanche-extension | Author: Richard Patterson | 2026-07-09
set -euo pipefail
REPO_URL="https://github.com/De-ASI-INTERFACE/x402-avalanche-extension"
TAG="v1.0.0"
MESSAGE="x402-Avalanche Extension v1.0.0 — Richard Patterson"
[ -f "lakefile.lean" ] || { echo "ERROR: Run from repo root."; exit 1; }
git fetch origin && COMMIT=$(git rev-parse HEAD)
git tag -a "$TAG" "$COMMIT" -m "$MESSAGE" && git push origin "$TAG"
echo "Tag $TAG pushed. Publish at: $REPO_URL/releases/new?tag=$TAG"
