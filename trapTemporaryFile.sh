#!/bin/bash

trap 'echo "Cleaning up..."; rm -f /tmp/tempfile; exit' EXIT

echo "Creating temporary file..."
touch /tmp/tempfile

echo "Doing some work..."
sleep 10

echo "Work done!"
