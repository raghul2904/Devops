#!/bin/bash
echo "Application deployed successfully on port 80"
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u vasavivodnala -p Asviarha@2014
    docker tag project vasavivodnala/dev:latest
    docker push vasavivodnala/dev:latest

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u vasavivodnala -p Asviarha@2014
    docker tag project vasavivodnala/prod:latest
    docker push vasavivodnala/prod:latest
fi
~
