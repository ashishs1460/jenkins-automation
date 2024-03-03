pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven_3_5_0"
    }

    stages {
        stage('Build maven') {
            steps{
            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ashishs1460/jenkins-automation']])
            sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t ashish1460/jenkins-integration:1.0 .'
                }
            }
        }
        stage('Push image to docker hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u ashish1460 -p ${dockerhubpwd}'
                    }
                    sh 'docker push ashish1460/jenkins-integration:1.0'
                }
            }
        }
    }
}