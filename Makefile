HAS_GLIDE := $(shell command -v glide;)
VERSION := "0.1.0"
LDFLAGS := "-X main.version=${VERSION}"

.PHONY: build
build:
	go build -ldflags $(LDFLAGS)

.PHONY: bootstrap
bootstrap:
ifndef HAS_GLIDE
	go get -u github.com/Masterminds/glide
endif
	glide install --strip-vendor
