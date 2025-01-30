pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
  }
  stages {
    stage('Clone Repository') {
      steps {
        git branch: 'dev', credentialsId: 'github-credentials-id', url: 'https://github.com/joe-prakash/devops-build.git'
      }
    }

    stage('Check Buildx') {
      steps {
        sh 'docker buildx version'
      }
    }

    stage('Set Up Buildx') {
      steps {
        script {
          sh '''
            docker buildx create --use --name mybuilder || echo "Builder already exists"
            docker buildx inspect --bootstrap
          '''
        }
      }
    }

    stage('Build and Push Image') {
      steps {
        script {
          def imageTag = (env.GIT_BRANCH == 'dev') ? 'joeprakkash/dev:latest' : 'joeprakkash/prod:latest'

          sh """
            docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}
            docker buildx build --platform linux/amd64 --no-cache -t ${imageTag} --push .
          """
        }
      }
    }

    stage('Deploy') {
      steps {
        sh './deploy.sh'
      }
    }
  }
}
