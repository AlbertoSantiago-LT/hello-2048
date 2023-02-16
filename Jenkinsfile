pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')
    }
    stages{
        stage('Terraform') {
            steps {
                sh './terraform apply -auto-approve'
            }
        }
    }
}
