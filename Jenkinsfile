pipeline {
    agent {label 'virtualbox_Jay_Desktop'}
    stages {
        // stage('checkout'){
        //   steps {
        //     checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '3f86cc1e-f2df-4525-93be-2b14a1457d99', url: 'https://github.com/yanjifei/temp']]])
        //   }
        // }
        stage('build') {
            steps {
                sh 'echo $LM_LICENSE_FILE'
                sh 'echo $PATH'
                // sh 'export PATH=/home/jay/intelFPGA_pro/21.2/questa_fe/bin/:$PATH'
                // sh 'which vsim'
                sh 'python3 --version'
                sh 'python3 hello.py'
                sh 'pip3 install wheel'
                sh 'pip3 install cocotb'
                sh 'vlog top.sv'
                // recordIssues(tools: [modelsim()])
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
