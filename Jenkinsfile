pipeline {
    agent { docker { image 'python:3.5.1' } }
    stages {
        stage('build') {
            steps {
                sh 'python3 --version'
                sh 'python3 hello.py'
            }
        }
    }
}