pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'echo $LM_LICENSE_FILE'
                sh 'python3 --version'
                sh 'python3 hello.py'
                sh 'vlog top.sv'
                sh 'cd adder/test && make'
                recordIssues(tools: [modelsim()])
            }
        }
    }
}
