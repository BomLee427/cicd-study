IMAGE_NAME=_IMAGE_NAME_
SERVICE_NAME=cicd

sudo aws ecr get-login-password --region ap-northeast-2 | sudo docker login --username AWS --password-stdin 491092715218.dkr.ecr.ap-northeast-2.amazonaws.com
sudo docker image prune -f
sudo docker pull ${IMAGE_NAME}

# 새로운 도커 컨테이너 실행
echo "IMAGE_NAME: $IMAGE_NAME 도커 실행"
cd /home/ubuntu/deploy
sudo docker compose up -d $SERVICE_NAME
