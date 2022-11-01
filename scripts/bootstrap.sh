#!/usr/bin/env bash
set -eu

SERVER_DIRECTORY="$(dirname $0)/../fizzbuzz_server"
pushd $SERVER_DIRECTORY

echo "#=== Getting mix dependencies..."
mix deps.get

echo "#=== Preparing ecto databases..."
mix ecto.create && mix ecto.migrate
MIX_ENV=test mix ecto.create && mix ecto.migrate

