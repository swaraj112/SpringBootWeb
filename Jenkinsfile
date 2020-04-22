node{
    stage('Initialize'){
      def dockerHome = tool 'docker'
      def mavenHome = tool 'maven'
      env.PATH = "${dockerHome}/bin:${mavenHome}/bin:${env.PATH}"
    }
    stage('Checkout'){
        git url: 'https://github.com/swarajgit/SpringBootWeb.git'
    }
    stage('Build'){
        sh 'mvn clean install -DskipTests'
    }
    stage('Build docker Image'){
        sh 'docker build -t swaraj1123/springboot:latest .'
    }
    stage('Docker Image push'){
        withDockerRegistry(credentialsId: 'swaraj_docker', toolName: 'docker') {
            sh 'docker push swaraj1123/springboot:latest'
        }
    }
    stage('Deploy to GKE') {
        step([$class: 'KubernetesEngineBuilder', projectId: 'river-karma-275008', clusterName: 'spring-rest-cluster', location: 'us-central1-c', manifestPattern: 'deployment.yaml', credentialsId: 'Google_cloud_serevice_key', verifyDeployments: true])
        }
}
