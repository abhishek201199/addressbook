pipeline {
    agent none

    stages {
           stage('compile') {
             agent any
            steps {
                sh 'mvn compile'
            }
        }
        stage('Test') {
             agent any
            steps {
               sh 'mvn test'
            }
        }
        stage('package') {
             agent {label'jen_slave'}
    //          environment {
    //     JAVA_HOME = '/usr/lib/jvm/java-11-amazon-corretto.x86_64'
    //     PATH = "${JAVA_HOME}/bin:${env.PATH}"
    // }
         tools {
        jdk 'JAVA11'
        maven 'mymaven'
    }
            steps {
                sh 'mvn package'
                sh 'java --version'
            }
        }
    }
}