#!/usr/bin/env bash

set -ex

echo "Starting server"
$SERVER &
SERVER_PID=$(echo $!)

sleep 5

echo "Running client"
CLIENT_OUT=$($CLIENT)

if [[ $CLIENT_OUT != "pong" ]]; then
  echo "Client should respond with 'pong', got: " $CLIENT_OUT
else
  echo "Success!"
fi

kill -9 $SERVER_PID
