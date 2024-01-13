#!/usr/bin/env bash
set -x
git checkout main
git add -A
git commit -m "automated push"
git push