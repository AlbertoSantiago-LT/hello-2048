pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')dock
    }
    stages {
        stage('Build') {
        steps {
                echo 'Build'
                sh '''docker-compose build
                docker pull ghcr.io/albertosantiago-lt/hello-2048/hello2048:latest
                git tag 1.0.${BUILD_NUMBER} 
                docker tag ghcr.io/albertosantiago-lt/hello-2048/hello2048:latest ghcr.io/albertosantiago-lt/hello-2048/hello-2048:1.0.${BUILD_NUMBER}

                '''
                sshagent(['ssh-github']) {
                    sh("git push git@github.com:AlbertoSantiago-LT/hello-2048.git --tags")
                }
                }
        }
        
        stage('Logg') {
            steps {
                withCredentials([string(credentialsId: 'github-token', variable: 'TOKEN_GIT')]) {
                    sh 'echo $TOKEN_GIT | docker login ghcr.io -u AlbertoSantiago-LT --password-stdin'
                    sh 'docker push ghcr.io/albertosantiago-lt/hello-2048/hello-2048:1.0.${BUILD_NUMBER}'
                    }
                }

            }
        stage('Prueba AWS') {
            steps {
                echo 'ssh a ec2'
                sshagent(['ssh-amazon']) {
                        sh '''
                        ssh -o "StrictHostKeyChecking no" ec2-user@34.245.134.70  
                        docker pull ghcr.io/albertosantiago-lt/hello-2048 && docker run -td --rm -p 80:80 ghcr.io/albertosantiago-lt/hello-2048
                        '''
                    }
                }

        }
    }
}
