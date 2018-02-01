pipeline {                                                                         
    agent {                                                                        
        label 'docker_ubuntu-16.04_ssh'                                                                
    }                                                                              
    stages {                                                                       
        stage('Build') {                                                           
            steps {                                                                
                sh 'uname -a'  
                sh 'lsb_release -a'
                sh './linux-kicad-full-gcc-head.sh'
            }                                                                      
        }                                                                          
    }                                                                              
} 
