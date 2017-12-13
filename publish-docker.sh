set -e

docker build -t ${REPOSITORY} . # Builds the Docker image

$(aws ecr get-login --no-include-email --region us-west-2 --registry-ids ${ACCOUNT}) #Logs you into the repository you want to upload to
# Note: the above commands require a recent AWS CLI

# Uploads the image's binaries together with its tag
docker tag ${REPOSITORY}:${TAG} ${ACCOUNT}.dkr.ecr.us-west-2.amazonaws.com/${REPOSITORY}:${TAG}
docker push ${ACCOUNT}.dkr.ecr.us-west-2.amazonaws.com/${REPOSITORY}:${TAG}

if [ ! -z "${COMMIT_HASH}" ]; then
    docker tag ${REPOSITORY}:${TAG} ${ACCOUNT}.dkr.ecr.us-west-2.amazonaws.com/${REPOSITORY}:git.hash-${COMMIT_HASH}
    docker push ${ACCOUNT}.dkr.ecr.us-west-2.amazonaws.com/${REPOSITORY}:git.hash-${COMMIT_HASH}
    echo "#### Tagged the Docker image with commit hash ${COMMIT_HASH} ####"
else
    echo "There is no commit hash to upload "
fi