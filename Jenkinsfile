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
            cat /var/secrets/google/key.json | img login -u _json_key --password-stdin https://gcr.io
            img push gcr.io/melgin/img-hello-world
          """
        }
      }
    }
  }
}