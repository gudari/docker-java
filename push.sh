set -ex

# docker hub username
USERNAME=gudari
# image name
IMAGE=java

version=`cat VERSION`
buildDate=`date +"%y.%m.%d"`

# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version
docker push $USERNAME/$IMAGE:$version-$buildDate