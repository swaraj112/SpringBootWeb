node{
    stage('Initialize'){
      def dockerHome = tool 'docker'
      def mavenHome = tool 'maven'
      env.PATH = "${dockerHome}/bin:${mavenHome}/bin:${env.PATH}"
    }
    stage('Checkout'){
        git credentialsId: 'afb29c50-d501-4c1d-8852-ce1a6193e8a6', url: 'https://github.com/swarajgit/SpringBootWeb.git'
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
            step <object of type com.google.jenkins.plugins.k8sengine.KubernetesEngineBuilder>
        }
}
