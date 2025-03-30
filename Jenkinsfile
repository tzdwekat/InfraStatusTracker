pipeline {
    agent {
        docker {
            image 'python:3.10'
        }
    }

    stages {
        stage('Run InfraStatusTracker') {
            steps {
                sh 'python3 main.py'
            }
        }
    }

    post {
        always {
            sh '''
            curl -v -u admin:admin123 \
              --upload-file status.log \
              http://host.docker.internal:8081/repository/infra-logs/status.log
            '''
        }
    }
}
