pipeline {
    agent { label 'dockerserver' }
    stages {
        stage('Build') {
            agent {
                docker {
                  label 'dockerserver'
                  image 'maven:3.6.3-jdk-8'
                }
            }
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
