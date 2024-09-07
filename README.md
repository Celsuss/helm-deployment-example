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

Get service.
`kubectl get svc -n flask-app-example-namespace`

Port forward so it can be accessed at http://127.0.0.1:8080/posts
`kubectl port-forward svc/flask-app-example-dev-flask-app-example-chart 8080:80 -n flask-app-example-namespace`

### Cleanup
Delete the production deployment:
`helm uninstall flask-app-example-prod --namespace flask-app-example-namespace`

Delete the development deployment:
`helm uninstall flask-app-example-dev --namespace flask-app-example-namespace`

Delete the namespace:
`kubectl delete namespace flask-app-namespace`

This will remove all the resources associated with your Flask application in Kubernetes.
