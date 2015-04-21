#!/bin/sh

curl -i \
-H "Content-Type: application/json" \
-X POST \
-d @data_activity1.json \
http://localhost:3000/api/v1/activities \
