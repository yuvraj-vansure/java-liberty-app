# Steps to Build and Deploy

## Pre-requisites
Tools required:
- docker 
- oc

## Step 1 - Build A Docker Image of Application 
### 1.1 Build A Docker Image
> Use  _`docker build`_ command to build the application Docker Image 

```sh
docker build -t <image-repo>/<image-name>:<tag> -f <Dockerfile-name> .
```
Example 

```
docker build -t  quay.io/yuvan/java-liberty-app:latest -f Dockerfile .
```
### 1.2 Login to docker repo/registry
> Login to docker repo/registry before pushing the image. 

```sh
docker login <registry> -u <username> -p <password>
```

### 1.3 Push Docker image to repository/registry
> Use  _`docker push`_ command to push the image to repository/registry

```sh
docker push <image-repo>/<image-name>:<tag>
```

## Step 2 - Deploy the application on OpenShift

### 2.1 Create a new Project/Namespace 
> Create new Project from OpenShift GUI dashboard, make sure you are administrator 

### 2.2 Login to openshit Using oc tool
> Use oc Command to login to openshift 
- In OpenShift Dashboard on top right corner click on User. 
- from drop down menu click on _`Copy login command`_, it'll open a new window. 
- On new Window click on _`Display Token`_, it'll show login token. Copy the _`oc login`_ command and run on terminal to login to OpenShit.

### 2.3 Deploy the application
- Once logged in to Openshift, Select the Project created in step 2.1 
```sh
oc project <project-name>
```

- go to `deploy` directory, It has following files
    - apply.sh 
    - delete.sh 
    - deploy.yml 
    - route.yml 
    - service.yml

- Run _`oc apply`_ comannd to install the resources
```sh
oc apply -f <file-name>
```

```sh
# Create deployment 
oc create -f deploy.yml
# Create service
oc create -f service.yml
# Create route
oc create -f route.yml
```
> **Note:** Also you can run  _`apply.sh`_ to create these resources 

### 2.4 Deleting the application
- Run _`oc delete`_ comannd to install the resources
```sh
oc apply -f <file-name>
```

```sh
# Delete deployment 
oc delete -f deploy.yml
# Delete service
oc delete -f service.yml
# Delete route
oc delete -f route.yml
```
> **Note:** Also you can run  _`delete.sh`_ to Delete these resources 