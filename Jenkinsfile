node {
    
    def Mavenhome = tool name: "maven3.9.2"
    
    echo "Build Number is: ${env.BUILD_NUMBER}"
    
    echo "Build Name is: ${env.BUILD_NAME}"
    
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '6', daysToKeepStr: '', numToKeepStr: '6')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([githubPush()])])
   
    
    stage ('Checkout code'){
        checkout scmGit(branches: [[name: '*/development']], extensions: [], userRemoteConfigs: [[credentialsId: '222316b0-5dac-41b5-9052-c40a4e14eaa5', url: 'https://github.com/skmdab/maven-web-application.git']])
    }
    
    stage ('Build'){
        sh "${Mavenhome}/bin/mvn clean package"
    }
    
    stage ('sonarqubereport'){
        sh "${Mavenhome}/bin/mvn sonar:sonar"
    }
    
    stage ('upload to artifact nexus'){
        sh "${Mavenhome}/bin/mvn deploy"
    }
    
    stage ('deploy to tomcat server'){
        sshagent(['3a0789ce-3faa-4647-95b8-2b8cb8e1f5bf']) {
        sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@10.0.0.158:/opt/tomcat8/webapps/"  
    }
    }
}
