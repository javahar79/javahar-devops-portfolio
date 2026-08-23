// last_verified: 2026-08-23 · Jenkins n/a

// Minimal declarative Jenkinsfile with build, test, and archive stages
// I kept this small because I'm still learning the pipeline syntax
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the project'
                // Replace with your real build command, e.g. npm run build, mvn package
                sh 'echo "Build step placeholder"'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests'
                // Replace with your real test command, e.g. npm test, mvn test
                sh 'echo "Test step placeholder"'
            }
        }
        stage('Archive') {
            steps {
                echo 'Archiving build artifacts'
                // archiveArtifacts keeps build outputs attached to the build record
                archiveArtifacts artifacts: '**/build-output/**', fingerprint: true
            }
        }
    }
}
