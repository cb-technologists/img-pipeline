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
            /home/user/bin/gcloud auth print-access-token | login -u oauth2accesstoken --password-stdin https://gcr.io
            img push gcr.io/melgin/img-hello-world
          """
        }
      }
    }
  }
}