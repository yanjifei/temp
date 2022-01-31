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
    }

    post {
       always {
            // archiveArtifacts artifacts: 'work_dir/**/output_files/*.gz', fingerprint: true, allowEmptyArchive: true
            // archiveArtifacts artifacts: 'work_dir/**/output_files/*.sof', fingerprint: true, allowEmptyArchive: true
            // archiveArtifacts artifacts: 'work_dir/**/output_files/*.rbf', fingerprint: true, allowEmptyArchive: true
            junit 'adder/tests/*.xml'
            xunit (
                thresholds: [ skipped(failureThreshold: '0'), failed(failureThreshold: '0') ],
                tools: [ JUnit(pattern: 'adder/tests/*.xml') ]
            )
        }
    }


}
