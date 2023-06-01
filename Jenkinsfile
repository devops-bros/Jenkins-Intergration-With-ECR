pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    environment {
    registry = '480854362041.dkr.ecr.us-east-1.amazonaws.com/devops-repo'
    registryCredential = 'jenkins-ecr'
    dockerimage = ''
  }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/devops-bros/Jenkins-Intergration-With-ECR.git'
            }
            stage (Sonarqube scan) {
                steps{
                withSonarQubeEnv('Sonarqube') {
            sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=devops-bros_geo-pipeline'
            
        }
        stage('Code Build') {
            steps {
                sh 'mvn clean install package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                } 
            }
        }
        stage('Deploy image') {
            steps{
                script{ 
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }  
    }
}
