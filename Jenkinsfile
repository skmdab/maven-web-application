pipeline{
    
    agent{
        label 'slave'
    }

    stages{
        stage('Checkout the code'){
            steps{
                git branch: 'testing', url: 'https://github.com/skmdab/maven-web-application.git'
            }
        }

        stage('Build the maven image'){
            steps{
                sh "docker build -t skmdab/mvn:1 ."
            }
        }

        stage('Deploying as container'){
            steps{
                sh "docker run -d --name mvnwebapp -p 8080:9000 skmdab/mvn:1"
            }
        }
    }
}
