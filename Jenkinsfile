pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git credentialsId: 'github-creds'
                url 'https://github.com/MATHIVANANIGRIS/project-java.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push mathivanantamil/mathi123'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker rm -f myapp-container || true'
                sh 'docker run -d -p 8090:8080 mathivanantamil/mathi123'
            }
        }

    }
}
