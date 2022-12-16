#!/bin/bash
parent_path=$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)

cd "$parent_path"

projectVersion=v1
array=(elasticsearch kibana logstash rabbitmq kafka jaeger apollo xxl-job sql-admin)

function note() {
  local GREEN NC
  RED='\033[0;31m'
  NC='\033[0m'
  printf "\n${RED}$@ ${NC}\n" >&2
}

function create_ns() {
  kubectl create namespace $1 --dry-run=client -o yaml | kubectl apply -f -
}

delete_ns() {
  kubectl delete ns $1
}

set -e

if [[ $@ == *"build-app"* ]]; then
  note "compiling..."
  cd ../
  mvn clean install -DskipTest
  docker build -f Dockerfile -t spring-app:$projectVersion .
  cd -
fi

if [[ $1 == *"start-app"* ]]; then
  cd ./k8s/spring-boot
  kubectl apply -f .
  cd -
fi

if [[ $1 == *"start"* ]]; then
  for project in ${@:2}; do
    if [[ " ${array[*]} " =~ " ${project} " ]]; then
      case $project in
      "rabbitmq")
        create_ns "rabbitmq"
        kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"
        cd ./k8s/${project}
        kubectl apply -f .
        username="$(kubectl get secret rabbitmq-default-user -n rabbitmq -o jsonpath='{.data.username}' | base64 --decode)"
        password="$(kubectl get secret rabbitmq-default-user -n rabbitmq -o jsonpath='{.data.password}' | base64 --decode)"
        echo "username: $username"
        echo "password: $password"
        cd -
        ;;
      "kafka")
        kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
        kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kube-app
        kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka
        ;;
#      "jaeger")
#        kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.1/cert-manager.yaml
#        kubectl create -f https://github.com/jaegertracing/jaeger-operator/releases/download/v1.39.0/jaeger-operator.yaml -n observability
#        ;;

      *)
        cd $project
        kubectl delete -f .
        cd -
        ;;

      esac

    else
      note "unsupported application:"
      printf '%s\n' "${array[@]}"
    fi
  done
fi

if [[ $1 == *"delete"* ]]; then
  for project in ${@:2}; do
    if [[ " ${array[*]} " =~ " ${project} " ]]; then
      case $project in
      "rabbitmq")
        kubectl rabbitmq delet rabbitmq -n kube-app
        ;;
      "kafka")
        kubectl -n kafka delete $(kubectl get strimzi -o name -n kube-app)
        delete_ns "kafka"
        ;;
      *)
        cd ./k8s/$project
        kubectl delete -f .
        cd -
        ;;
      esac
    else
      note "unsupported application:"
      printf '%s\n' "${array[@]}"
    fi
  done
fi

if [[ $1 == *"delete-all"* ]]; then
  minikube delete --purge
fi
