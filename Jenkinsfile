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
                withCredentials([usernamePassword(credentialsId: 'badd24f7-ad18-40df-8508-73eff65a3b05', usernameVariable: 'User', passwordVariable: 'Pass')]) {
                    bat 'docker login -u %User% -p %Pass%'
                    bat 'docker tag my-app %User%/my-app'
                    bat 'docker push %User%/my-app'
                }
            }
        }
    }
}