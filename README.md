# helm-deployment-example
helm deployment example

## Call the api
`curl http://127.0.0.1:3000/posts`
`curl http://127.0.0.1:3000/posts?userId=1`
## Docker
Build docker image.
`docker build -t flask-app-example .`
Run the docker image.
`docker run -p 3000:3000 flask-app-example`
## Kubernetes
Create kubernetes docker pull secret.
`kubectl create secret docker-registry ghcr-secret --docker-server=ghcr.io --docker-username=$GH_USERNAME --docker-password=$GH_TOKEN -n flask-app-example-namespace`
Deploy dev.
`helm upgrade --install flask-app-example-dev ./flask-app-example-chart/ -f ./flask-app-example-chart/values-dev.yaml --namespace flask-app-example-namespace`
Deploy prod.
`helm upgrade --install flask-app-example-prod ./flask-app-example-chart/ -f ./flask-app-example-chart/values-prod.yaml --namespace flask-app-example-namespace`
Get pods.
`kubectl get pods -n flask-app-example-namespace`
