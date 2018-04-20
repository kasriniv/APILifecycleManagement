#!/bin/bash
# sed to replace old app name with new application
###NOTE THIS IS THE  MAC SED VERSION..MIGHT NEED EDITS FOR LINUX
#put usage
# step 1 create dir with appname
# step 2 cd to that dir
# step 3 git clone appname.git
# mvn fabric8:deploy -Popenshift
# sleep for 1 minute
# curl test the app
echo $1
if [ -z "$1" ] ; then
        echo "appname should be provided"
fi
exit
appname=$1
echo "you should NOT see this if no param provided"
