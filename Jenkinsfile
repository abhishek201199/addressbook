pipeline {
    agent any

    // tools {
    //     // Install the Maven version configured as "M3" and add it to the path.
    //     maven "mymaven"
    // }

    stages {
        stage('Compile') {
            steps {
               echo "compiling teh code"
               sh "mvn compile"
            }
        }
        stage('UnitTest') {
            steps {
               echo "Test teh code"
               sh "mvn test"
            }
        }
        stage('Package') {
            steps {
               echo "Package teh code"
               sh "mvn package"
            }
        }
    }
}
