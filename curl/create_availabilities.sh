#!/bin/sh

curl -i \
-H "Content-Type: application/json" \
-X POST \
-d @data_availability1.json \
http://localhost:3000/api/v1/availabilities \
