pipeline {                                                                         
    agent {                                                                        
        label 'docker_ubuntu-16.04_ssh'                                                                
    }                                                                              
    stages {
        stage('Checkout') {
            steps {
              checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/KiCad/kicad-source-mirror.git']]])
            }
        }
        stage('Build') {                                                           
            steps {                                                                
                sh 'uname -a'  
                sh 'lsb_release -a'
                sh './linux-kicad-full-gcc-head.sh'
            }                                                                      
        }                                                                          
    }                                                                              
} 
