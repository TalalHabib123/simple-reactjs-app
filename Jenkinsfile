pipeline {
    agent any
    stages{
        stage('Checkout'){
            steps{
                git 'https://github.com/TalalHabib123/simple-reactjs-app.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t my-app .'
            }
        }
        stage('Run Docker Image') {
            steps {
                bat 'docker run -d -p 3000:3000 --name Lab10 my-app'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'badd24f7-ad18-40df-8508-73eff65a3b05', usernameVariable: 'TalalHabib123', passwordVariable: '21058820981')]) {
                    sh 'docker login -u $TalalHabib123 -p $21058820981'
                    sh 'docker tag my-app $TalalHabib123/my-app'
                    sh 'docker push $TalalHabib123/my-app'
                }
            }
        }
    }
}