pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'echo $LM_LICENSE_FILE'
                sh 'echo $PATH'
                sh 'export PATH=/home/jay/intelFPGA_pro/21.2/questa_fe/bin/:$PATH'
                sh 'which vsim'
                sh 'python3 --version'
                sh 'python3 hello.py'
                sh 'pip3 install cocotb'
                sh 'vlog top.sv'
                recordIssues(tools: [modelsim()])
            }
        }
        stage('Unit Test') {
          steps{
            sh 'make -C adder/tests/'
            junit 'adder/tests/*.xml'
            sh 'make -C matrix_multiplier/tests/'
            junit 'matrix_multiplier/tests/*.xml'
            sh 'make -C simple_dff/'
            junit 'simple_dff/*.xml'
          }
        }

    }

    // post {
    //    always {
    //         // archiveArtifacts artifacts: 'work_dir/**/output_files/*.gz', fingerprint: true, allowEmptyArchive: true
    //         // archiveArtifacts artifacts: 'work_dir/**/output_files/*.sof', fingerprint: true, allowEmptyArchive: true
    //         // archiveArtifacts artifacts: 'work_dir/**/output_files/*.rbf', fingerprint: true, allowEmptyArchive: true
    //         // junit 'adder/tests/*.xml'
    //     }
    // }


}
