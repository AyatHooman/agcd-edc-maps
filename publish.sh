#!/bin/bash
###############################################################################
# Publish these maps to GitHub Pages (repo: AyatHooman/agcd-edc-maps).
#
# The site is fully static:
#   index.html                      landing page (choose a run)
#   <run_key>/index.html            per-run viewer (choose a date)
#   <run_key>/dates.json            available dates
#   <run_key>/data/<date>.json.gz   one gzipped plotly figure per date
#   assets/plotly.min.js            self-hosted plotly bundle (no CDN needed)
#
# NOTE: the 2026-08 rebuild replaced the old per-month HTML files (~1.1 GB)
# with the slim json.gz viewer. To also drop the old blobs from the repo's
# history (so the repo shrinks instead of doubling), publish from a fresh
# history once:
#
#   git checkout --orphan rebuild && git add -A
#   git commit -m "rebuilt site: run -> date viewer, all 5 runs incl. daily"
#   git branch -M rebuild main
#   git push --force origin main
#
# Subsequent updates are normal pushes:
#   git add -A && git commit -m "update maps" && git push
#
# GitHub Pages stays configured as before (branch: main, folder: / root).
# Site: https://AyatHooman.github.io/agcd-edc-maps/
###############################################################################
GH_USER="AyatHooman"
GH_REPO="agcd-edc-maps"

cd "$(cd "$(dirname "$0")" && pwd)"
git remote remove origin 2>/dev/null
git remote add origin "https://github.com/${GH_USER}/${GH_REPO}.git"
echo "Pushing main to https://github.com/${GH_USER}/${GH_REPO} ..."
git push -u origin main
echo "Site: https://${GH_USER}.github.io/${GH_REPO}/"
