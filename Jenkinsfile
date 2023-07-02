pipeline{
    
    agent{
        label 'slave'
    }

    
    stages{
        stage('Checkout the code'){
            steps{
                git branch: 'development', url: 'https://github.com/skmdab/maven-web-application.git'
            }
        }

        stage('Build the docker image'){
            steps{
                sh "docker build -t skmdab/mavenwebapp:${BUILD_NUMBER} ."
            }
        }
        
        stage('Docker image push to dockerhub'){
            steps{
                sh "docker push skmdab/mavenwebapp:${BUILD_NUMBER}"
            }
        }

        stage('Changed to docker-compose file'){
            steps{
                sh "sed -i s/VERSION/${BUILD_NUMBER}/g docker-compose.yml"
            }
        }

        stage('Deploy into docker image'){
            steps{
                sshagent(['ubuntu-creds']) {
                sh "scp -o StrictHostKeyChecking=no docker-compose.yml ubuntu@10.0.0.180:"
                sh "ssh -o StrictHostKeyChecking=no ubuntu@10.0.0.180 docker-compose up -d"
            }
            }
            
        }
    }
}
