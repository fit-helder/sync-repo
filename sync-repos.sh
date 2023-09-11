#!/bin/sh

set -e

echo "Setting repo variables"
repo_origin="$(REPO_ORIGIN)"
repo_destin="$(REPO_DESTIN)"

echo "Create destin dir"
mkdir /destin
cd /destin

echo "Cloning destination git repository"
git clone --mirror $repo_origin .

echo "Setting git variables"
git remote rm origin
git remote add origin "$repo_destin"

echo "Pushing git updates"
git push -u origin --all
git push --tags
