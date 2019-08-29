pipeline {
  agent {
    kubernetes {
      label "img"
      yamlFile 'imgPod.yaml'
    }
  }
  stages {
    stage('Build and Push') {
      environment {
        DOCKER_HUB = credentials('docker-hub')
      }
      steps {
        container('img') {
          sh """
            img build -t mattelgin/img-hello-world .
            img login -u DOCKER_HUB_USR -p $DOCKER_HUB_PSW
            img push mattelgin/img-hello-world
          """
        }
      }
    }
  }
}