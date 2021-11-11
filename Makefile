
IMAGE?=carloferrigno/sas:19.1.0
IMAGE_LATEST?=carloferrigno/sas:latest

push: build
	docker push $(IMAGE) 
	docker push $(IMAGE_LATEST) 

build: Dockerfile
	docker build . -t $(IMAGE) 
	docker build . -t $(IMAGE_LATEST) 

pull:
	docker pull $(IMAGE) 
	docker pull $(IMAGE_LATEST) 

test: build
	docker run -e HOME_OVERRRIDE=/tmp-home -v $(PWD):/tmp-home -it carloferrigno/sas:latest bash -c 'source /init.sh; bash $$HOME/self-test.sh'
 
squash: build
	docker-squash -t $(IMAGE)-squashed $(IMAGE)

singularity: squash
	docker run -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}:/output --privileged -t --rm quay.io/singularity/docker2singularity $(IMAGE)-squashed
