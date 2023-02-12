pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')
    }
    stages {
        stage('Build') {
        steps {
                echo '\033[34mStage Build\033[0m'
                sh '''docker-compose build
                docker pull ghcr.io/albertosantiago-lt/hello-2048/hello2048:v2
                git tag 1.0.${BUILD_NUMBER} 
                docker tag ghcr.io/albertosantiago-lt/hello-2048/hello2048:v2 ghcr.io/albertosantiago-lt/hello-2048/hello-2048:1.0.${BUILD_NUMBER}

                '''
                echo '\033[34mSSH\033[0m'
                sshagent(['ssh-github']) {
                    sh("git push git@github.com:AlbertoSantiago-LT/hello-2048.git --tags")
                }
                }
        }
        
        stage('Logg') {
            steps {
                withCredentials([string(credentialsId: 'github-token', variable: 'TOKEN_GIT')]) {
                    echo '\033[34mlOG\033[0m'
                    sh 'echo $TOKEN_GIT | docker login ghcr.io -u AlbertoSantiago-LT --password-stdin'
                    sh 'docker push ghcr.io/albertosantiago-lt/hello-2048/hello-2048:1.0.${BUILD_NUMBER}'
                    }
                }

            }
        stage('Prueba AWS') {
            steps {
                echo '\033[34mAMAZON\033[0m'
                sshagent(['ssh-amazon']) {
                        sh '''
                        ssh -o "StrictHostKeyChecking no" ec2-user@34.245.134.70 docker pull ghcr.io/albertosantiago-lt/hello-2048 && docker run -td --rm -p 80:80 ghcr.io/albertosantiago-lt/hello-2048
                        '''
                    }
                }

        }
    }
}
