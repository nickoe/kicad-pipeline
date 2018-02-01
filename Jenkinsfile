pipeline {                                     
  agent {                                    
    label 'docker_ubuntu-16.04_ssh'                                
  }                                        
  stages {
    stage('KiCad Checkout') {
      steps {
        git 'https://github.com/nickoe/kicad-pipeline.git'
        dir('kicad') {
          checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/KiCad/kicad-source-mirror.git']]])
          sh 'pwd && ls'
          sh 'ls ..
        }
      }
    }
    stage('Build') {                               
      steps {                                
        sh 'uname -a'  
        sh 'lsb_release -a'
        sh 'pwd && ls'
        sh 'ls /home/jenkins/ws'
        sh './linux-kicad-full-gcc-head.sh'
      }                                    
    }                                      
  }                                        
} 
