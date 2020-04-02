[![dockeri.co](https://dockeri.co/image/airdock/python-poetry)](https://hub.docker.com/r/airdock/python-poetry)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)](https://GitHub.com/airdock-io/docker-python-poetry/graphs/commit-activity)
[![Ask Us Anything !](https://img.shields.io/badge/Ask%20us-anything-1abc9c.svg?style=for-the-badge)](https://github.com/airdock-io)
![Open Source Love svg1](https://img.shields.io/static/v1?label=OpenSource&message=%E2%9D%A4&color=blue&style=for-the-badge)

[![GitHub issues](https://img.shields.io/github/issues/airdock-io/docker-python-poetry.svg?style=flat-square)](https://GitHub.com/airdock-io/docker-python-poetry/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/airdock-io/docker-python-poetry.svg?style=flat-square)](https://GitHub.com/airdock-io/docker-python-poetry/issues?q=is%3Aissue+is%3Aclosed)
[![Travis Ci Status](https://img.shields.io/travis/com/airdock-io/docker-python-poetry?style=flat-square)](https://travis-ci.com/airdock-io/docker-python-poetry)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://lbesson.mit-license.org/)


<img src="https://python-poetry.org/images/logo-origami.svg" alt="Poetry" width="200" height="200">

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/airdock-io/docker-python-poetry?sort=semver&style=flat-square)
# docker-python-poetry
A docker container to run poetry

## Prerequisites

  - Having Docker and docker-compose installed (=> https://docs.docker.com/install/ & https://docs.docker.com/compose/install/)
  - Having a Sonarqube server and a project to analyze

## Getting started
Just clone the repo with the usual : ```git clone https://github.com/airdock-io/docker-python-poetry.git```
 - Enter the repo
 - Type ```make build``` to build the image locally
 - If you want to see other commands available ```make help```

Be aware that, before it will execute your command it will execute a ```poetry install``` to make sure that a venv is created and that command will be executed properly.
See https://python-poetry.org/ for more informations on configration

Then to use the image locally: ```docker run --rm -v ${PWD}:/app python-poetry:latest```

Or to use the image from docker hub: ```docker run --rm -v ${PWD}:/app airdock/python-poetry:latest```

## Environment variables
Some of these vars are defined in the Dockerfile and others are not. Vars used by the entrypoint and command should be defined in dockerfile, vars relative to the command are defined (if not in compose *environment* section) in entrypoint with a default value.

| Var                     | Default Value     |
|-------------------------|-------------------|
| HOME                    | /usr/local/lib    |

## Init scripts
Every scripts located (or mounted) in the ```/docker-entrypoint-init.d``` folder and ending with *sh* will be executed at startup before the command.

