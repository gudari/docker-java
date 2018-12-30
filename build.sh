set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=gudari
# image name
IMAGE=java

version=`cat VERSION`
split_major_version=(${version//u/ })
split_minor_version=(${split_major_version[1]//-/ })

JAVA_VERSION_MAJOR=${split_major_version[0]}
JAVA_VERSION_MINOR=${split_minor_version[0]}
JAVA_VERSION_BUILD=${split_minor_version[1]}
HASH=`cat HASH`

buildDate=`date +"%y.%m.%d"`


docker build \
  --build-arg JAVA_VERSION_MAJOR=$JAVA_VERSION_MAJOR \
  --build-arg JAVA_VERSION_MINOR=$JAVA_VERSION_MINOR \
  --build-arg JAVA_VERSION_BUILD=$JAVA_VERSION_BUILD \
  --build-arg JAVA_URL_HASH=$HASH \
  -t $USERNAME/$IMAGE:$version-$buildDate \
  -t $USERNAME/$IMAGE:$version \
  -t $USERNAME/$IMAGE:latest .
