pipeline {
    agent none
    tools {
        maven 'maven' 
    }
    environment {
        DEPLOY_SERVER = 'ec2-user@172.31.8.93'  // Remote server to SSH into
         
    }

    stages {
        stage('compile') {
             agent any
            steps {
                echo 'compile the job'
                sh 'mvn compile'
            }
        }
         stage('test') {
             agent any
            steps {
                echo 'unit test'
                sh 'mvn test'
            }
        }
         stage('package') {
             agent any
            steps {
                sshagent(['slave2']) {  // Replace with your Jenkins SSH credential ID
                sh "scp -o StrictHostKeyChecking=no server-config.sh ${DEPLOY_SERVER}:/home/ec2-user"
                sh "ssh -o StrictHostKeyChecking=no ${DEPLOY_SERVER} 'bash server-config.sh'"
                    
                }
                echo 'this is pacakge'
                sh 'mvn package'
            }
        }
    
        
        
        
        
    }
    
}
