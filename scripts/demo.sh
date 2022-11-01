#!/usr/bin/env bash
set -eu

ROOT_DIRECTORY="$(dirname $0)/../"
SERVER_DIRECTORY="$(dirname $0)/../fizzbuzz_server"
CLI_DIRECTORY="$(dirname $0)/../fizzbuzz_cli"

echo "#=== Preparing DEMO..."

cd $ROOT_DIRECTORY
echo "Please ensure you have ASDF installed, more info here: https://asdf-vm.com/"
./scripts/bootstrap.sh

echo "#=== Starting Phoenix server..."
pushd $SERVER_DIRECTORY
{ mix phx.server --open >/dev/null & }  || (
  echo "WARN: Could not start phoenix server, might already be running."
)
popd

echo "#=== Running all tests..."
./scripts/test.sh

echo "#=== Running OClif CLI against server..."

pushd $CLI_DIRECTORY
echo "#=== Listing numbers..."
./bin/dev list --page=123 --per-page=10 | jq
echo "#=== Saving a favourite..."
./bin/dev save 123 | jq
echo "#=== Removing a favourite..."
./bin/dev remove 123 | jq
popd

echo "#=== Demo complete."
