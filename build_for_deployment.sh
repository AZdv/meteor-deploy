#!/bin/bash

PATH_TO_APP='../app'
echo "Building Meteor App to a directory..."
( cd ${PATH_TO_APP}; meteor build --directory . )
echo "Getting NPM packages for project"
( cd ${PATH_TO_APP}/bundle/programs/server; npm install )
echo "Copying start_server.sh and stop_server.sh scripts to app"
cp st*.sh ${PATH_TO_APP}/bundle/
echo "Creating tar.gz file (in the parent folder)"
( cd ${PATH_TO_APP}; tar -zcvf ../bundle_$(date +"%d_%m_%Y_T%H_%M_%S").tar.gz bundle )
echo "Removing Bundle Directory..."
rm -rf ${PATH_TO_APP}/bundle