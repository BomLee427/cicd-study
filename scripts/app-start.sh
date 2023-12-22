IMAGE_FILE_PATH="/home/ubuntu/deploy/image.txt"
IMAGE_NAME=$(cat "$IMAGE_FILE_PATH")
CONTAINER_ENV_PATH="/home/ubuntu/env/.env"
SERVICE_NAME=cicd

echo aws ecr get-login-password --region ap-northeast-2 | sudo docker login --username AWS --password-stdin 491092715218.dkr.ecr.ap-northeast-2.amazonaws.com
echo sudo docker pull ${IMAGE_NAME}

# Docker Compose YAML을 새로운 도커 버전으로 작성해서 저장
echo "version: '3.8'

services:
  cicd:
    container_name: cicd-study
    image: ${IMAGE_NAME}
    ports:
      - 8080:8080" > docker-compose.yaml

# 새로운 도커 컨테이너 실행
echo "IMAGE_NAME: $IMAGE_NAME 도커 실행"
docker-compose up -d $SERVICE_NAME
