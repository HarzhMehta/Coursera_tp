#!/bin/bash
# simple-interest.sh - calculate simple interest

read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (annual %): " rate
read -p "Enter the time period (in years): " time

# Validate numeric input
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $principal =~ $re ]] || ! [[ $rate =~ $re ]] || ! [[ $time =~ $re ]]; then
  echo "Error: principal, rate and time must be numeric." >&2
  exit 1
fi

# Calculate simple interest
si=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf("%.2f", (p * r * t) / 100) }')

echo "Simple Interest: $si"
