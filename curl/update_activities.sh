#!/bin/sh

curl -i \
-H "Content-Type: application/json" \
-X DELETE \
http://localhost:3000/api/v1/availabilities/2
