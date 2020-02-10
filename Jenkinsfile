pipeline {
    agent any
    stages {
        stage('Initialize')
        {
          def mavenHome  = tool 'maven 3.6.3'
          env.PATH = "${mavenHome}/bin:${env.PATH}"
        }
        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
    }
}
