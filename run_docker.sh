PORT=8000
app_dir=$(cd $(dirname $0);pwd)
cache_dir=/home/ryota/.cache/huggingface
IMAGE_NAME=pytorch/pytorch
TAG=latest


docker run --gpus all -it -p $PORT:8000 \
  -v $app_dir:/workspace \
  -v $cache_dir:/opt/hf_cache \
  --env TRANSFORMERS_CACHE=/opt/hf_cache \
  $IMAGE_NAME:$TAG bash
