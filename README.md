# helm-deployment-example
helm deployment example

## Call the api
`curl http://127.0.0.1:3000/posts`
`curl http://127.0.0.1:3000/posts?userId=1`
## Docker
`docker build -t flask-app .`
`docker run -p 3000:3000 flask-app`
