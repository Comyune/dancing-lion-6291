#!/usr/bin/env bash
set -eu

SERVER_DIRECTORY="$(dirname $0)/../fizzbuzz_server"
pushd $SERVER_DIRECTORY

iex -S mix phx.server
