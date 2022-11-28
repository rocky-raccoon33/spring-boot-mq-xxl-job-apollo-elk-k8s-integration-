#!/bin/bash

bash ./apollo/startup.sh 
bash ./xxl/startup.sh
bash ../app/startup.sh

kubectl apply -f ./sql-admin.yaml