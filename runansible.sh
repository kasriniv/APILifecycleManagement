#!/bin/bash
# sed to replace old app name with new application
###NOTE THIS IS THE  MAC SED VERSION..MIGHT NEED EDITS FOR LINUX
#put usage
echo $1
echo "old application name "
echo $2
echo "new app name"
sed -i .bak 's/'$1'/'$2'/g' newservicedetails.yml
sed -i .bak 's/'$1'/'$2'/g' updateservicedetails.yml
myvar=http://vertx$2-$2.<blahip>.nip.io:80
echo $myvar


myvar2=api_backend:$myvar
echo $myvar2


sed -i .bak 's%'api_backend:.*'%'api_backend:\\\ $myvar'%g' updateservicedetails.yml

ansible-playbook  -u ec2-user --inventory-file=ansiblehosts --private-key=<yourpemkeyfile>.pem updateservice.yml
