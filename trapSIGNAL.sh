#!/bin/bash

trap 'echo "Interrupt signal received"; exit' INT

while true; do
    echo "Running..."
    sleep 1
done
