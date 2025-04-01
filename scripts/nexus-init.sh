#!/bin/bash
# Wait for Nexus to be ready
until curl -s http://nexus:8081/service/rest/v1/status | grep "operational"; do
  echo "Waiting for Nexus..."
  sleep 5
done

# Create infra-logs repository if not exists
curl -u admin:admin123 \
  -X POST http://nexus:8081/service/rest/v1/repositories \
  -H 'Content-Type: application/json' \
  -d '{
        "name": "infra-logs",
        "type": "hosted",
        "format": "maven2",
        "storage": {
          "blobStoreName": "default",
          "strictContentTypeValidation": true,
          "writePolicy": "ALLOW"
        }
      }'
