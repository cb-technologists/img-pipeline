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
            img build -t gcr.io/melgin/img-hello-world ./hello-world
            gcloud auth print-access-token | img login -u oauth2accesstoken --password-stdin https://gcr.io
            img push gcr.io/melgin/img-hello-world
          """
        }
      }
    }
  }
}