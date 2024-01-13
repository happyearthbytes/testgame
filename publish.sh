#!/usr/bin/env bash
echo "Update the publish branch to match main"
set -x
git push origin --force main:publish