# last_verified: 2026-08-06 · jenkins n/a

pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo 'Hello from Jenkins!'
            }
        }
    }
}