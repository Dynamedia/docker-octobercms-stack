#!/bin/bash

# We want to persist some of our data on the host so create some directories. This is not strictly necessary but I want the structure to be clear

# Create data directories for the October CMS app
mkdir -p ./data/{storage/{app/{media,uploads/public},logs},plugins,themes}
touch ./data/storage/app/media/.gitkeep
touch ./data/storage/app/uploads/public/.gitkeep
touch ./data/storage/logs/.gitkeep
touch ./data/plugins/.gitkeep
touch ./data/themes/.gitkeep

# Create directories for our database and cache
mkdir ./data/{mysql,redis}
touch ./data/mysql/.gitkeep
touch ./data/redis/.gitkeep