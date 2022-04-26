#!/usr/bin/env sh

set -e
terraform init
terraform plan
terraform apply -auto-approve

printf "\nWaiting for the echo web server service... \n"
#kubectl apply -f app-services.yaml
kubectl apply -f app-bar.yaml
kubectl apply -f app-microservice2.yaml
sleep 15

printf "\nYou should see 'foo' as a reponse below (if you do the ingress is working):\n"
curl http://localhost/bar
curl http://localhost/home