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
          sh 'ls ..'
        }
      }
    }
    stage('Configure') {
      steps {
        sh 'mkdir build'
        dir('build') {
          sh 'cmake  -DKICAD_SPICE=OFF -DKICAD_USE_OCE=OFF ../kicad '
        }
      }
    }
    stage('Make') {                               
      steps {      
        dir('build') {
          sh 'uname -a'  
          sh 'lsb_release -a'
          sh 'pwd && ls'
          sh 'ls /home/jenkins/ws'
          sh 'make -j4'
          //sh '../linux-kicad-full-gcc-head.sh'
        }
      }                                    
    }                                      
    stage('Test') {
      steps {
        sh 'mkdir build'
        dir('build') {
          sh 'echy "Say What?"'
        }
      }
    }
  }                                        
} 
