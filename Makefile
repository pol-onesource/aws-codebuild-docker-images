BUILDS=standard/4.0
NAME=$(shell dirname $@)
VERSION=$(shell basename $@)
TAG=aws/codebuild/$(NAME):$(VERSION)
#LOGIN := $(shell aws ecr get-login --region eu-west-1 --no-include-email)

ifdef http_proxy
BLD_OPTS=--build-arg http_proxy=$$http_proxy --build-arg https_proxy=$$https_proxy --build-arg no_proxy=$$no_proxy
endif

all: $(BUILDS)

$(BUILDS):
#	$(LOGIN)
	cd ubuntu/$(NAME)/$(VERSION) && \
	docker build $(BLD_OPTS) -t $(TAG) .
#	docker build -t <account>.dkr.ecr.eu-west-1.amazonaws.com/build:latest . &&\
	docker push <account>.dkr.ecr.eu-west-1.amazonaws.com/build:latest


