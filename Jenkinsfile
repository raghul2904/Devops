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
    stage('Build Image') {
    steps {
        script {
            try {
                sh 'docker build --no-cache -t react-app:latest .'
            } catch (Exception e) {
                error "Docker build failed: ${e.message}"
            }
        }
    }
}
    stage('Push to Docker Hub') {
      steps {
        script {
          if (env.GIT_BRANCH == 'dev') {
            sh 'docker tag react-app:latest joeprakkash/dev:latest'
            sh 'docker push joeprakkash/dev:latest'
          } else if (env.GIT_BRANCH == 'main') {
            sh 'docker tag react-app:latest joeprakkash/prod:latest'
            sh 'docker push joeprakkash/prod:latest'
          }
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
