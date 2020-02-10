pipeline {
    agent { label 'docker' }
    stages {
        stage('Build') {
            agent {
                docker {
                  label 'Docker_Jenkins'
                  image 'maven:3.6.3-jdk-8'
                }
            }
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
