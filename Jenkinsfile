pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Image'){
            steps{
                bat 'docker build -t=diwakar15/selenium .'
            }
        }

        stage('Push Image'){
            steps{
                bat 'docker push diwakar15/selenium'
               }
        }

    }

    post {
        always {
            bat 'docker logout'
        }
    }

}