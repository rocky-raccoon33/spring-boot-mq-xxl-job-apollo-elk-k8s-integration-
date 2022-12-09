
kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"
# kubectl rabbitmq install-cluster-operator # install Cluster Operator via rabbitmq plugin

# https://strimzi.io/quickstarts/
# create kafka operator
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
# create kafka cluster
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka 
# delete kafka cluster
kubectl -n kafka delete $(kubectl get strimzi -o name -n kafka)
# custom example
https://github.com/strimzi/strimzi-kafka-operator/tree/0.32.0/examples/kafka