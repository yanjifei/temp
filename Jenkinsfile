pipeline {
    agent { docker { image 'python:3.7.9' } }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
                sh 'python hello.py'
            }
        }
    }
}