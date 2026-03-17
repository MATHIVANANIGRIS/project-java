pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/yourusername/devops-java-project.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t yourdockerhub/devops-app .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push yourdockerhub/devops-app'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8090:8080 yourdockerhub/devops-app'
            }
        }

    }
}
