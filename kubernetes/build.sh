#!/bin/bash

projectVersion=v1
projectArray=(alpha)
elkArray=(elasticsearch kibana logstash)

function note() {
  local GREEN NC
  GREEN='\033[0;32m'
  NC='\033[0m'
  printf "\n${GREEN}$@ ${NC}\n" >&2
}

set -e

if [[ $@ == *"build"* ]]; then
  note "Building images..."
  for project in ${projectArray}; do
    note "Compiling $project..."
    cd $project
    mvn clean install -DskipTest
    docker build -f docker/Dockerfile -t $project:$proejctVersion .
    cd -
  done

  for elk in ${elkAray[*]}; do
    note "Compiling $elk..."
    cd elk/$elk
    docker build -f Dockerfile -t $elk:$projectVersion .
    cd -
  done
fi

if  [[ $@ == *"stop"* ]]; then
    note "Stopping..."
    kubectl delete all --all
fi