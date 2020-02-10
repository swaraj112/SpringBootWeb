pipeline {
    agent {
      docker {image 'maven:3.6.3-jdk-8'}
    }
    stages {
        stage('Build...') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage(Build-Docker-img){
            agent{
              dockerfile{
                filename 'Dockerfile'
              }
            }
        }
    }
}
