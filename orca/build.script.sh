set -e

APP_NAME=orca
GIT_REFERENCE=master
GIT_REPO=https://github.com/lookout/${APP_NAME}

cd ${APP_NAME}

if [ ! -d ${APP_NAME} ] ; then
    git clone ${GIT_REPO}
    cd ${APP_NAME}
else
    cd ${APP_NAME}
    git fetch
fi

git checkout ${GIT_REFERENCE}
git pull

echo "%%% Checked out ${APP_NAME}"

if [ -f Dockerfile ] ; then
    rm Dockerfile Dockerfile.slim
fi
echo "%%% Removed the Netflix Dockerfiles for ${APP_NAME}"  ## We could improve this part by ignoring the Dockerfiles from the public project...but I (Bruno) am not sure how to do it

./gradlew ${APP_NAME}-web:installDist -x test
echo "%%% Created installation files for running ${APP_NAME}"


# Publish docker image
ACCOUNT=769716316905
REPOSITORY=${APP_NAME}
TAG=latest
COMMIT_HASH="$(git rev-parse --verify HEAD)"

cd ..

. ../publish-docker.sh
