pipeline {
    agent any

    tools {
        nodejs 'node20'  // Make sure NodeJS 20 is installed in Jenkins
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Vuthy-Tourn/nextjs-space-tourism'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-nextjs-pipeline .'
            }
        }

        stage('Deploy') {
            steps {
                sh """
                docker stop nextjs-cont || true
                docker rm nextjs-cont || true

                docker run -dp 3000:3000 \
                    --name nextjs-cont \
                    jenkins-nextjs-pipeline
                """
            }
        }

    }

    post {
        success {
            echo '✅ Next.js CI/CD Pipeline Successful'
        }
        failure {
            echo '❌ Next.js CI/CD Pipeline Failed'
        }
    }
}
