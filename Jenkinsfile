pipeline {
  agent {
    kubernetes {
      label "img"
      yamlFile 'imgPod.yaml'
    }
  }
  stages {
    stage('Build and Push') {
      steps {
        container('img') {
          sh """
            img build -t gcr.io/melgin/img-hello-world .
            img push gcr.io/melgin/img-hello-world
          """
        }
      }
    }
  }
}