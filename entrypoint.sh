#!/bin/sh

STARTDATE=$(date +"%Y-%m-%d")

# Alpine-compatible date calculation
#STARTDATE=$(date -u +"%Y-%m-%d" -d "@$(($(date +%s) - 7*24*60*60))")

if [ -z "$STARTDATE" ]; then
  echo "Failed to compute start date. Exiting."
  exit 1
fi

echo "Running withings-sync for start date: $STARTDATE"

exec withings-sync \
  -f "$STARTDATE" \
  -v \
  --features BLOOD_PRESSURE \
  --garmin-username "$GARMIN_USERNAME" \
  --garmin-password "$GARMIN_PASSWORD"