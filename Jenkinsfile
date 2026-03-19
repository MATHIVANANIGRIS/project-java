pipeline {
    agent any

    environment {
        IMAGE = 'mathivanantamil/mathi123'
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-creds',
                    url: 'https://github.com/YOUR-REPO.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-creds',
                    usernameVariable: 'mathivanan',
                    passwordVariable: 'PASS_WORD'/
                )]) {
                    sh '''
                    echo $PASS | docker login -u mathivanantamil --password-stdin
                    docker tag myapp mathivanantamil/mathi123
                    docker push mathivanantamil/mathi123
                    '''
                }
            }
        }

        stage('Deploy to Web Server') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no ubuntu@107.20.103.240 << EOF

                docker pull myapp

                docker rm -f myapp || true

                docker run -d -p 8090:8080 --name myapp 

                EOF
                '''
            }
        }
    }
}
