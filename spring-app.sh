#!/bin/bash
# shellcheck disable=SC2164
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

mvn package
docker build -t alpha/app .
docker tag alpha/app bugfans/spring-app:0.01
docker push bugfans/spring-app:0.01

kubectl apply -f deployment.yaml