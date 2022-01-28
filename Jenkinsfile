pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'echo $LM_LICENSE_FILE'
                sh 'python3 --version'
                sh 'python3 hello.py'
                sh 'vlog top.sv'
                sh 'call conda activate py39'
                sh 'python --version'
                sh 'make -C adder/tests/'
                recordIssues(tools: [modelsim()])
            }
        }
    }
}
