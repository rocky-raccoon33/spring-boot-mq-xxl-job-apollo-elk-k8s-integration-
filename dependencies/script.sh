#!/bin/bash

bash ./apollo/startup.sh 
bash ./xxl/startup.sh

kubectl apply -f ./sql-admin.yaml
kubectl apply -f ./namespace-sre.yaml