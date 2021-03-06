include makefiles/task.mk 
include makefiles/deploy-ghpages.mk
include makefiles/docker.mk
## DEPLOY ##

NAME_IMAGE = manuelaflores16/orbis-training-docker
DOCKER_TAG = 4.0.0
DOCKER_IMAGE = ${NAME_IMAGE}:${DOCKER_TAG}
NAME = "Manuela"
USERNAME = manuelaflores16

install:
	docker run -it -v ${PWD}:/app ${DOCKER_IMAGE} npm install

start:
	docker run -it -v ${PWD}:/app -p "3030:1042" ${DOCKER_IMAGE} npm start   

release:
	docker run -it --rm --tty=false -v ${PWD}:/app -p "3030:1042" ${DOCKER_IMAGE} npm run release 

greet:
	docker run --entrypoint=/app/resources/example.sh -it -v ${PWD}:/app -e NAME=${NAME} ${DOCKER_IMAGE}

recursos:
	echo 'hola recursos!'

test: 
	echo ${DOCKER_IMAGE}

jenkins.build:
	docker build -t ${USERNAME}/jenkins-deploy:0.1.0 docker/jenkins

jenkins.run:
	docker run --rm -u root -p 8080:8080 -v ${PWD}/jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock ${USERNAME}/jenkins-deploy:0.1.0
