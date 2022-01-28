pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'echo $LM_LICENSE_FILE'
                sh 'echo $PATH'
                sh 'python3 --version'
                sh 'python3 hello.py'
                sh 'vlog top.sv'
                sh 'conda activate py39'
                sh 'make -C adder/tests/'
                recordIssues(tools: [modelsim()])
            }
        }
    }
}
