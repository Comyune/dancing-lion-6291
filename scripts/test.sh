#!/usr/bin/env bash
set -eu

SERVER_DIRECTORY="$(dirname $0)/../fizzbuzz_server"
CLI_DIRECTORY="$(dirname $0)/../fizzbuzz_cli"

pushd $SERVER_DIRECTORY
echo "#=== Running Phoenix tests..."
mix test
echo "#=== Running Elixir credo"
mix credo
popd

pushd $CLI_DIRECTORY
echo "#=== Running NPM tests..."
npm test
popd
