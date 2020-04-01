[![dockeri.co](https://dockeri.co/image/airdock/sonarqube-scanner)](https://hub.docker.com/r/airdock/sonarqube-scanner)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)](https://GitHub.com/airdock-io/docker-sonarqube-scanner/graphs/commit-activity)
[![Ask Us Anything !](https://img.shields.io/badge/Ask%20us-anything-1abc9c.svg?style=for-the-badge)](https://github.com/airdock-io)
![Open Source Love svg1](https://img.shields.io/static/v1?label=OpenSource&message=%E2%9D%A4&color=blue&style=for-the-badge)

[![GitHub issues](https://img.shields.io/github/issues/airdock-io/docker-sonarqube-scanner.svg?style=flat-square)](https://GitHub.com/airdock-io/docker-sonarqube-scanner/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/airdock-io/docker-sonarqube-scanner.svg?style=flat-square)](https://GitHub.com/airdock-io/docker-sonarqube-scanner/issues?q=is%3Aissue+is%3Aclosed)
[![Travis Ci Status](https://img.shields.io/travis/com/airdock-io/docker-sonarqube-scanner?style=flat-square)](https://travis-ci.com/airdock-io/docker-sonarqube-scanner)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://lbesson.mit-license.org/)


![Sonarqube](https://www.sonarqube.org/logos/index/sonarqube-logo.png)

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/airdock-io/docker-sonarqube-scanner?sort=semver&style=flat-square)
# docker-sonarqube-scanner
A docker container to run sonarqube scanner

## Prerequisites

  - Having Docker and docker-compose installed (=> https://docs.docker.com/install/ & https://docs.docker.com/compose/install/)
  - Having a Sonarqube server and a project to analyze

## Getting started
Just clone the repo with the usual : ```git clone https://github.com/airdock-io/docker-sonarqube-scanner.git```
 - Enter the repo
 - Type ```make build``` to build the image locally
 - If you want to see other commands available ```make help```

Then you will need the file sonar-scanner.properties filled with your properties
__important: you have to fill the file and complete it with the informations corresponding to languages and test reports__
For instance: if you have a php project you could add those 2 lines:
```
sonar.php.tests.reportPath=path/to/your/.sonar.test.xml
sonar.php.coverage.reportPaths=path/to/your/.sonar.coverage.xml
```
See https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/ for more informations on configration

Then to use the image locally: ```docker run --rm -v ${PWD}/sonar-scanner.properties:/var/sonar-scanner/conf/sonar-scanner.properties -v path/to/your/code:/var/app sonarqube-scanner:latest```

Or to use the image form docker hub: ```docker run --rm -v ${PWD}/sonar-scanner.properties:/var/sonar-scanner/conf/sonar-scanner.properties -v path/to/your/code:/var/app airdock/sonarqube-scanner:latest```

## Environment variables
Some of these vars are defined in the Dockerfile and others are not. Vars used by the entrypoint and command should be defined in dockerfile, vars relative to the phrasea php app are defined (if not in compose *environment* section) in entrypoint with a default value.

| Var                     | Default Value |
|-------------------------|---------------|
| SONAR_SCANNER_VERSION   | 4.3.0.2102    |
| JAVA_HOME               | /usr          |