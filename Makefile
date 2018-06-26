HAS_GLIDE := $(shell command -v glide;)
VERSION := $(shell grep -zoP 'k8s.io\/helm\n\s+version:\s\K\S+' glide.yaml)
LDFLAGS := "-X main.version=${VERSION}"

.PHONY: build
build:
	CGO_ENABLED=0 go build -ldflags $(LDFLAGS)

.PHONY: bootstrap
bootstrap:
ifndef HAS_GLIDE
	go get -u github.com/Masterminds/glide
endif
	glide install --strip-vendor
