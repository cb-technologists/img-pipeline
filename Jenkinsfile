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
        GCR_TOKEN = credentials('gcr-token')
      }
      steps {
        container('img') {
          sh """
            img build -t gcr.io/melgin/img-hello-world .
            img login -u _json_key -p $GCR_TOKEN  https://gcr.io
            img push gcr.io/melgin/img-hello-world
          """
        }
      }
    }
  }
}