# Helm-Template Standalone

This is a standalone Helm template utility to help chart developers debug their charts.

Based on Helm template plugin by [technosophos](https://github.com/technosophos/helm-template) and [Helm](https://github.com/kubernetes/helm) source.

It works like `helm install --dry-run --debug`, except that it runs locally, has more output
options, and is quite a bit faster.

## Usage

Render chart templates locally and display the output.

This does not require Helm or Tiller. However, any values that would normally be
looked up or retrieved in-cluster will be faked locally. Additionally, none
of the server-side testing of chart validity (e.g. whether an API is supported)
is done.

```
$ helm-template [flags] CHART
```

### Flags:

```
  -x, --execute stringArray   only execute the given templates.
  -h, --help                  help for helm-template
  -n, --namespace string      namespace (default "NAMESPACE")
      --notes                 show the computed NOTES.txt file as well.
  -o, --output-dir string     store the output files in this directory.
  -r, --release string        release name (default "RELEASE-NAME")
      --set stringArray       set values on the command line. See 'helm install -h'
  -f, --values valueFiles     specify one or more YAML files of values (default [])
  -v, --verbose               show the computed YAML values as well.
```


## Install
[![Build Status](https://travis-ci.org/n0madic/helm-template.svg?branch=master)](https://travis-ci.org/n0madic/helm-template)

[Get binary files](https://github.com/n0madic/helm-template/releases) or install from source:

```
$ go get -u github.com/n0madic/helm-template
```

The above will fetch the latest release of `helm-template` and install it.

### Developer (From Source) Install

If you would like to handle the build yourself, instead of fetching a binary,
this is how recommend doing it.

First, set up your environment:

- You need to have [Go](http://golang.org) installed. Make sure to set `$GOPATH`
- If you don't have [Glide](http://glide.sh) installed, this will install it into
  `$GOPATH/bin` for you.

Clone this repo into your `$GOPATH`. You can use `go get -d github.com/n0madic/helm-template`
for that.

```
$ cd $GOPATH/src/github.com/n0madic/helm-template
$ make bootstrap build
```

That last command will skip fetching the binary install and use the one you
built.
