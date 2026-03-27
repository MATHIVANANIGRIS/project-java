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
                    url: 'https://github.com/MATHIVANANIGRIS/project-java.git'
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
                    credentialsId: 'dockerhub-cres',
                    usernameVariable: 'USER_NAME',
                    passwordVariable: 'PASS_WORD')])
                {
                    sh '''
                    echo "$PASS_WORD" | docker login -u "$USER_NAME" --password-stdin
                    docker tag myapp mathivanantamil/mathi123
                    docker push mathivanantamil/mathi123
                    '''
                }
            }
       }

        stage('Deploy to Web Server') {
            steps {
                sshagent(['ssh-access']){
                sh '''
                ssh -o StrictHostKeyChecking=no ubuntu@10.0.2.33 << 'EOF'

                sudo docker pull myapp mathivanantamil/mathi123

                sudo docker rm -f myapp || true

                sudo docker run -d -p 8090:8080 --name myapp mathivanantamil/mathi123 

                EOF
                '''
            }
        }
    }
}

}
