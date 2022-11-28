#!/bin/bash
# shellcheck disable=SC2164
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

#./mvnw clean install
#
#docker build -t alpha/app:0.1 .
#docker tag alpha/app:0.1 bugfans/spring-app
#docker push bugfans/spring-app

kubectl apply -f deployment.yaml