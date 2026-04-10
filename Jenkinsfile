pipeline {
    agent any

    stages {
        stage('compile') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('Test') {
            steps {
               sh 'mvn test'
            }
        }
        stage('package') {
    //          environment {
    //     JAVA_HOME = '/usr/lib/jvm/java-11-amazon-corretto.x86_64'
    //     PATH = "${JAVA_HOME}/bin:${env.PATH}"
    // }
         tools {
        jdk 'JAVA11'
    }
            steps {
                sh 'mvn package'
                sh 'java --version'
            }
        }
    }
}