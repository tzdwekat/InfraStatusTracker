pipeline {
    agent {
        docker {
            image 'python:3.10'
        }
    }

    stages {
        stage('Verify Python') {
            steps {
                sh 'python --version'
            }
        }
        stage('Run InfraStatusTracker') {
            steps {
                sh '''
                echo "Running main.py..."
                python salt/infra_status/files/main.py
                '''
            }
        }
    }

    post {
        always {
            script {
                if (fileExists('salt/infra_status/files/status.log')) {
                    sh '''
                    curl -v -u admin:admin123 \
                      --upload-file salt/infra_status/files/status.log \
                      http://host.docker.internal:8081/repository/infra-logs/status.log
                    '''
                } else {
                    echo "status.log not found — skipping upload"
                }
            }
        }
    }
}
