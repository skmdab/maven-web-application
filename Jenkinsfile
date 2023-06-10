// Powered by Infostretch 

timestamps {

node () {

	stage ('walmart-dev - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/development']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '222316b0-5dac-41b5-9052-c40a4e14eaa5', url: 'https://github.com/skmdab/maven-web-application.git']]]) 
	}
	stage ('walmart-dev - Build') {
 	
// Unable to convert a build step referring to "hudson.plugins.ws__cleanup.PreBuildCleanup". Please verify and convert manually if required.
// Unable to convert a build step referring to "hudson.plugins.timestamper.TimestamperBuildWrapper". Please verify and convert manually if required.		// Maven build step
	withMaven(maven: 'maven3.9.2') { 
 			if(isUnix()) {
 				sh "mvn clean package sonar:sonar deploy " 
			} else { 
 				bat "mvn clean package sonar:sonar deploy " 
			} 
 		} 
	}
	stage ('walmart-dev - Post build actions') {
/*
Please note this is a direct conversion of post-build actions. 
It may not necessarily work/behave in the same way as post-build actions work.
A logic review is suggested.
*/
// Unable to convert a post-build action referring to "hudson.plugins.deploy.DeployPublisher". Please verify and convert manually if required.
		// Mailer notification
		step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: 'skmdab@pm.me', sendToIndividuals: false])
 
	}
}
}