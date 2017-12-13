set -e

APP_NAME=deck
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


echo "%%% Updating the default Gate URL"
mv settings.js settings.js-old
python ../cheese-gate-url.py
rm settings.js-old
echo "%%% Done updating the default Gate URL"


# Publish docker image
ACCOUNT=769716316905
REPOSITORY=${APP_NAME}
TAG=latest
COMMIT_HASH="$(git rev-parse --verify HEAD)"

. ../../publish-docker.sh
