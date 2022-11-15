#!/usr/bin/env bash

set -e
ROOT_FOLDER=$(pwd)

cp -R ${ROOT_FOLDER}/git-users-api/* ${ROOT_FOLDER}/output
rm -fr ${ROOT_FOLDER}/output/ci && rm -fr ${ROOT_FOLDER}/output/.git

pushd git-users-api
    VERSION=`echo "$(git rev-parse --short HEAD)-$(date +'%s')"`
    VERSION-HASH=`echo "$(git rev-parse --short HEAD)`
popd

echo "${VERSION}" > ${ROOT_FOLDER}/output/version
echo "${VERSION-HASH}" > ${ROOT_FOLDER}/output/version-hash