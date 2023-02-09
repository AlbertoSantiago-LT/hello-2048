pipeline {
    agent any
    options {
        timestamps()
        ansiColor('xterm')dock
    }
    stage('Build') {
      steps {
                echo 'Build'
                sh "docker-compose build"
                sh "git tag 1.0.${BUILD_NUMBER}"
                sshagent(['ssh-github']) {
                    sh "git push --tags"
                }
                sh "docker tag ghcr.io/albertosantiago-lt/hello-2048:latest ghcr.io/albertosantiago-lt/hello-2048:1.0.${BUILD_NUMBER}"
            }
        }

    stages {
        stage('Pack') {
            steps {
                withCredentials([string(credentialsId: 'github-token', variable: 'CR_PAT')]) {
                    sh 'echo $CR_PAT | docker login ghcr.io -u AlbertoSantiago-LT --password-stdin'
                    echo "docker-compose push"
                    echo "docker push ghcr.io/codehead/hello-2048:1.0.${BUILD_NUMBER}"
                }
            }

        }
        stage('Prueba AWS') {
          steps {
                echo 'ssh a ec2'
                sshagent(['ssh-amazon']) {
                        sh """
                        ssh -o "StrictHostKeyChecking no" ec2-user@34.252.241.135 docker-compose pull ghcr.io/albertosantiago-lt/hello-2048/hello2048:v2
                        """
                    }
            }

        }
    }
}
