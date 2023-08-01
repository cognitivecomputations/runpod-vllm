# runpod vllm worker


### Optional - build base image locally
```shell
docker build -t winglian/runpod-worker-vllm:latest .
```

### Bake model into image

replace `<your-docker-username>`, `<model-tag>`, and `<your-model-name>` below

```shell
export DOCKER_USER=<your-docker-username>
docker build -t $DOCKER_USER/runpod-worker-vllm:<model-tag> --build-arg MODEL_NAME="<your-model-name>" --build-arg MODEL_BASE_PATH="/model/" -f Dockerfile-model .
docker push $DOCKER_USER/runpod-worker-vllm:<model-tag>
```
