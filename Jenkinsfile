pipeline {
    agent any
    tools {
        maven 'maven' 
    }

    stages {
        stage('compile') {
            steps {
                echo 'compile the job'
                sh 'mvn compile'
            }
        }
         stage('test') {
            steps {
                echo 'unit test'
                sh 'mvn test'
            }
        }
         stage('package') {
            steps {
                echo 'this is pacakge'
                sh 'mvn package'
            }
        }
    
        
        
        
        
    }
    
}
