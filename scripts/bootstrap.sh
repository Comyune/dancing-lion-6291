#!/usr/bin/env bash
set -eu

ROOT_DIRECTORY="$(dirname $0)/../"
CLI_DIRECTORY="$(dirname $0)/../fizzbuzz_cli"
SERVER_DIRECTORY="$(dirname $0)/../fizzbuzz_server"

cd $ROOT_DIRECTORY
echo "#=== Installing ASDF dependencies..."
asdf install

cd $SERVER_DIRECTORY
echo "#=== Getting mix dependencies..."
mix deps.get

echo "#=== Preparing ecto databases..."
mix ecto.create && mix ecto.migrate
MIX_ENV=test mix ecto.create && mix ecto.migrate

cd $CLI_DIRECTORY
echo "#=== Installing NPM depencies"
npm install
