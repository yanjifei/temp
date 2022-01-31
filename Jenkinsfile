pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'echo $LM_LICENSE_FILE'
                sh 'echo $PATH'
                sh 'python3 --version'
                sh 'python3 hello.py'
                sh 'pip3 install cocotb'
                sh 'vlog top.sv'
                sh 'make -C adder/tests/'
                recordIssues(tools: [modelsim()])
            }
        }
        stage('Unit Test') {
          steps{
            junit 'adder/tests/*.xml'
          }
        }

    }

    post {
       always {
            // archiveArtifacts artifacts: 'work_dir/**/output_files/*.gz', fingerprint: true, allowEmptyArchive: true
            // archiveArtifacts artifacts: 'work_dir/**/output_files/*.sof', fingerprint: true, allowEmptyArchive: true
            // archiveArtifacts artifacts: 'work_dir/**/output_files/*.rbf', fingerprint: true, allowEmptyArchive: true
            junit 'adder/tests/*.xml'
        }
    }


}
