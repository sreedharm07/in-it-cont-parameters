#!/bin/bash

for parameter in catalogue.pod.mongo_url,MONGO_URL catalogue.prod.DOCUMENTDB,DOCUMENTDB; do
  ssm_parameter=$(echo $parameter | awk -F, '{print $1}')
  app_parameter=$(echo $parameter | awk -F, '{print $2}')
  aws ssm get-parameter --name $app_parameter --with-decryption | jq .Parameter.Value | sed -e 's/"//g'
done