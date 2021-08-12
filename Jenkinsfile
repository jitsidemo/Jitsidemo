pipeline {
    agent any

    stages {

        stage('deploy') {
            steps {
                sh "mvn package"
            }
        }

        stage('Build Docker image'){
            steps {

                sh 'docker build -t  jitsidemo/jitsi_backend:${BUILD_NUMBER} .'
            }
        }

        stage('Docker Login'){

            steps {
                 withCredentials([string(credentialsId: 'jitsidockerhub', variable: 'Dockerhub')]) {
                    sh "docker login -u jitsidemo -p ${Dockerhub}"
                }
            }
        }

        stage('Docker Push'){
            steps {
                sh 'docker push jitsidemo/jitsi_backend:${BUILD_NUMBER}'
            }
        }

        stage('deploy on production'){
              when{
                    expression{ env.GIT_BRANCH =='origin/production'}
                  }

            steps {

//                      sh 'docker stop $(docker ps --filter publish=8082/tcp -q)'
                     sh 'docker run -itd -p 8090:8090 jitsidemo/jitsi_backend:${BUILD_NUMBER}'
            }
        }

        stage('deploy on master'){

         when{
                expression{ env.GIT_BRANCH =='origin/master'}
              }
                    steps {

//                             sh 'docker stop $(docker ps --filter publish=8081/tcp -q)'
                            sh 'docker run -itd -p  8091:8091 jitsidemo/jitsi_backend:${BUILD_NUMBER}'
                          }
            }


        stage('Archiving') {
            steps {
                 archiveArtifacts '**/target/*.jar'
            }

        }
    }
}
