node{
    stage('Checkout'){
        git credentialsId: 'afb29c50-d501-4c1d-8852-ce1a6193e8a6', url: 'https://github.com/swarajgit/SpringBootWeb.git'
    }
    stage('Build'){
        sh 'mvn clean install'
    }
    stage('Build docker Image'){
        sh 'docker build -t swaraj1123/springboot:latest .'
    }
    stage('Docker Image push'){
        withDockerRegistry(credentialsId: '064af0a5-cde4-480c-8a14-87eabe184f04', toolName: 'docker') {
            sh 'docker push swaraj1123/springboot:latest'
        }
    }
    stage('Kuberneetes Deploy'){
        kubernetesDeploy configs: 'spboot-deployment.yml', dockerCredentials: [[credentialsId: '064af0a5-cde4-480c-8a14-87eabe184f04']], enableConfigSubstitution: false, kubeConfig: [path: ''], kubeconfigId: 'e9d7ade7-21d9-4f64-ae80-891fd1b25713', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
    }
}
