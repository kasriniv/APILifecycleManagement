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

appname=$1
echo "name of app to be deployed"
cd  /Volumes/D/demotemp/temp

pwd
sleep 10s
git clone https://github.com/kasriniv/$appname.git
sleep 10s
cd $appname
pwd
oc login -u admin -p <blahpwd> https://<blah>.compute.amazonaws.com:8443

oc new-project $appname

sleep 10s

mvn fabric8:deploy -Popenshift
sleep 50s
curl http://vertx$appname-$appname.<BLAHIP>.nip.io/$appname
