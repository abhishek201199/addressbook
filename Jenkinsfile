pipeline {
    agent none
    tools {
        maven 'maven' 
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
             agent { label 'jenkin_slave' }
            steps {
                echo 'this is pacakge'
                sh 'mvn package'
            }
        }
    
        
        
        
        
    }
    
}
