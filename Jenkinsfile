pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')
    }
    stages{
       stage('Terraform') {
           steps{	
               withAWS(credentials: 'Credentials_aws', region: 'eu-west-1') {
                    sh 'ls'
                    sh 'terraform fmt'
	            sh 'terraform apply -auto-approve'
                }
	    }
        }
    }
}
