#!/bin/bash

# We want to persist some of our data on the host so create some directories. This is not strictly necessary but I want the structure to be clear

# Create data directories for the October CMS app
mkdir -p ./data/app/{storage/{media,uploads/public},plugins,themes}
touch ./data/app/storage/media/.gitkeep
touch ./data/app/storage/uploads/public/.gitkeep
touch ./data/app/plugins/.gitkeep
touch ./data/app/themes/.gitkeep

# Create directories for our database and cache
mkdir ./data/{mysql,redis}
touch ./data/mysql/.gitkeep
touch ./data/redis/.gitkeep