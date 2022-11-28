#!/bin/bash
# shellcheck disable=SC2164
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

kubectl apply -f ./db.yaml &&
kubectl apply -f ./xxl-job-admin.yaml
