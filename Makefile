BUILDS=standard/4.0
NAME=$(shell dirname $@)
VERSION=$(shell basename $@)
TAG=aws/codebuild/$(NAME):$(VERSION)
REGION=eu-west-2
ACCOUNT=588494385378
LOGIN := $(shell aws ecr get-login --region $(REGION) --no-include-email)

ifdef http_proxy
BLD_OPTS=--build-arg http_proxy=$$http_proxy --build-arg https_proxy=$$https_proxy --build-arg no_proxy=$$no_proxy
endif

all: $(BUILDS)

$(BUILDS):
	$(LOGIN)
	cd ubuntu/$(NAME)/$(VERSION) && \
	docker build $(BLD_OPTS) -t $(TAG) .	
	docker build -t $(ACCOUNT).$(REGION).amazonaws.com/$(TAG) . &&\
	docker push $(ACCOUNT).$(REGION).amazonaws.com/$(TAG)


