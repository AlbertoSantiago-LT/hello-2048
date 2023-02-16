pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')
    }
    stages{
       stage('Terraform') {
           steps{
               sshagent(['ssh-amazon']) {
                   withAWS(credentials: 'Credentials_aws', region: 'eu-west-1') {
                        sh 'ls'
                        sh 'terraform init'
                        sh 'terraform fmt'
                        sh 'terraform validate'
	                sh 'terraform apply -auto-approve'
                        ansiblePlaybook credentialsId: 'ssh-amazon', inventory: './ansible/inventory', playbook: './ansible/httpd.yml'
                    }
                }
	    }
        }
    }
}
