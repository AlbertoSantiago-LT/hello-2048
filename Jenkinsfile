pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')
    }
    stages{
        stage('Terraform') {
            withAWS(credentials: 'Credentials_aws', region: 'eu-west-1') {
	        sh 'terraform apply -auto-aprove'
	    }
        }
    }
}
