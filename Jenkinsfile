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
        container('gcloud') {
          script {
            env.GCLOUD_ACCESS_TOKEN = sh(returnStdout: true, script: "gcloud auth print-access-token").trim()
          }
        }
        container('img') {
          sh """
            img build -t gcr.io/melgin/img-hello-world .
            echo ${env.GCLOUD_ACCESS_TOKEN} img login -u _json_key --password-stdin https://gcr.io
            img push gcr.io/melgin/img-hello-world
          """
        }
      }
    }
  }
}