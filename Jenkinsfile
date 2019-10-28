pipeline {
  agent {
    kubernetes {
      label "img"
      yamlFile 'img-resources/imgPod.yaml'
    }
  }
  stages {
    stage('Build and Push') {
      steps {
        container('img') {
          sh """
            img build -t gcr.io/melgin/img-hello-world ./hello-world
            gcloud auth configure-docker --quiet
            img push gcr.io/melgin/img-hello-world
          """
        }
      }
    }
  }
}