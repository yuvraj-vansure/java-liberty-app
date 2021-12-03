oc apply -f deploy.yml
oc apply -f service.yml
echo "wait for  5 sec"
oc apply -f route.yml
