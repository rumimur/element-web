#!/bin/bash

set -ex

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Linking js-sdk"
cd $BASE_DIR/../js-sdk
yarn link
yarn --network-timeout=100000 install

echo "Linking react-sdk"
cd $BASE_DIR/../react-sdk
yarn link
yarn link matrix-js-sdk
yarn --network-timeout=100000 install
yarn reskindex

echo "Setting up element-web with react-sdk and js-sdk packages"
cd $BASE_DIR/..
yarn link matrix-js-sdk
yarn link matrix-react-sdk
yarn build