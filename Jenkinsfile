pipeline {
  agent {
    kubernetes {
      yamlFile 'imgPod.yaml'
    }
  }
  stages {
    stage('Build and Push') {
      steps {
        container('img') {
          sh """
            img build -i gcr.io/melgin/img-hello-world .
            img push gcr.io/melgin/img-hello-world
          """
        }
      }
    }
  }
}