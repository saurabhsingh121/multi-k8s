docker build -t saurabhsingh121/multi-client:latest -t saurabhsingh121/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t saurabhsingh121/multi-server:latest -t saurabhsingh121/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t saurabhsingh121/multi-worker:latest -t saurabhsingh121/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push saurabhsingh121/multi-client:latest
docker push saurabhsingh121/multi-client:$SHA
docker push saurabhsingh121/multi-server:latest
docker push saurabhsingh121/multi-server:$SHA
docker push saurabhsingh121/multi-worker:latest
docker push saurabhsingh121/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=saurabhsingh121/multi-server:$SHA
kubectl set image deployments/client-deployment client=saurabhsingh121/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=saurabhsingh121/multi-worker:$SHA