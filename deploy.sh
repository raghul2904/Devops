#!/bin/bash
docker login -u sowmyadevop -p dckr_pat_7PN2WliApoSTDmCzMKzSPma_-GU
docker build -t mydeployment .

if [ $GIT_BRANCH = "dev" ]; then

    docker tag mydeployment sowmyadevop/dev
    docker push sowmyadevop/dev
elif [ $GIT_BRANCH = "main" ]; then

    docker tag mydeployment sowmyadevop/prod
    docker push sowmyadevop/prod
fi
