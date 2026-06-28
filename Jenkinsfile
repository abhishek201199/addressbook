pipeline {
    agent none
 tools {
        maven 'mymaven' 
    }
     environment{
        BUILD_SERVER='ec2-user@172.31.34.191'
        IMAGE_NAME='abhishek201100/addbook'
    }
    stages {
           stage('compile') {
             agent any
            steps {
                sh 'mvn compile'
            }
        }
        stage('Test') {
            agent any
    //          environment {
    //     JAVA_HOME = '/usr/lib/jvm/java-11-amazon-corretto.x86_64'
    //     PATH = "${JAVA_HOME}/bin:${env.PATH}"
    // }
         tools {
        jdk 'JAVA11'
        maven 'mymaven' 
    }
            steps {
                sh 'mvn test'
                sh 'java --version'
            }
        }
        stage('image') { // running on slave2 via ssh-agent
            agent any
            steps {
                script{
                    sshagent(['slave2']) {
                    echo "Executing the code"
                    sh "scp  -o StrictHostKeyChecking=no server-config-docker.sh ${BUILD_SERVER}:/home/ec2-user"
                    sh "ssh -o StrictHostKeyChecking=no ${BUILD_SERVER} 'bash server-config-docker.sh ${IMAGE_NAME} ${BUILD_NUMBER}'"
                }
                }
              
            }

            
        }

  stage ('push to docker hub'){
                    agent any
                    steps {
                        script {
                            sshagent(['slave2']){
                    withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                      sh "ssh -o StrictHostKeyChecking=no ${BUILD_SERVER} sudo docker login -u ${USER} -p ${PASS}"
                      sh "ssh -o StrictHostKeyChecking=no ${BUILD_SERVER}  sudo docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
                    }
                                
                            }

                        }

                    }
                }




    }
}