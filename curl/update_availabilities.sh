#!/bin/sh

curl -i \
-H "Content-Type: application/json" \
-X PUT \
-d @update_data_availability.json \
http://localhost:3000/api/v1/availabilities/11
