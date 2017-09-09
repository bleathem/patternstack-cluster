# A PatternStack cluster

## Introduction

This repo facilitates working with a PatternStack container cluster.  The cluster consists of the following services:

- patternstack-ng: An Angular web application
- patternstack-node: A node.js API endpoint
- patternstack-nginx: A static webserver
- swagger-ui: The swagger ui tool
- swagger-editor: The swagger editor tool

The goal of this cluster project is to facilitate development and deployment of a web application that uses a dedicated _frontend API server_ to bridge backend API endpoints into the browser.  By executing a single command, you can be up and running with a web applicaiton preconfigured to connect to a node.js API backend.  This same cluster is ready to be deployed to a production PaaS like Openshift.

Read on for details on how to take advantage of the simplifactions provided by this preconfigured frontend devlopment cluster.

## Getting started

The development environment depends only on haivng both docker and docker-compose installed.  Installation instructions for each of these can be found at:

- docker: https://docs.docker.com/engine/installation/
- docker-compose: https://docs.docker.com/compose/install/

### Install the services

Run `./scripts/services.sh clone` to install the service repositories locally.

## Start the cluster

Next, run `docker-compose up` to start the cluster in locally running containers.  The containers can be accessed via the following urls:

- patternstack-ng (ng): http://localhost:4200
- patternstack-node (api): http://localhost:3000
- patternstack-nginx: _not yet implemented_
- swagger-ui: http://localhost:8080
- swagger-editor: http://localhost:8081

## Developing the application

The _ng_ and _node_ services are both configured to livereload when there source code changes.  The source folders from the local filesystem are mounted into the docker containers to enable you to edit the files locally with your favorite IDE.

To get started simply open each of the service folders in your favorite IDE and start hacking!

### API docs

API docs can be viewed at http://localhost:8080/

The swagger editor can be used to edit the swagger at http://localhost:8081/ by loading the swagger file from http://localhost:3000/apidocs/swagger.yml.  After making your changes, download the new swagger file and replace the swagger file in the patternstack-node repo.

## Restarting containers

Sometimes you need to make a change to a container that isn't reflected via the live reload.  To load this change, one has to rebuild and restart the container.  This can be achieved with:

```
docker-compose create ng
docker-compose restart ng
```

## Still to come:

- Add OpenShift deployment isntructions using [kedge](https://github.com/kedgeproject/kedge)
- Automate API endpoint creation from the swagger file
- Simplify the swagger editin process
