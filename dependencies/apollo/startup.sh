#!/bin/bash
# shellcheck disable=SC2164
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

kubectl apply -f ./db.yaml &&
kubectl apply -f ./config-server/service-apollo-config-server.yaml &&
kubectl apply -f ./admin-service/service-apollo-admin-server.yaml &&
kubectl apply -f ./portal/service-apollo-portal-server.yaml