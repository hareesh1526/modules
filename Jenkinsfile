pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')  
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/hareesh1526/modules.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Approval Required') {
            steps {
                script {
                    def userInput = input message: "Do you want to proceed with Terraform Apply?", 
                                         parameters: [booleanParam(name: 'Proceed', defaultValue: false, description: 'Approve Deployment')]
                    
                    if (!userInput) {
                        error("Deployment stopped by user.")
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Approval for Destroy') {
            steps {
                script {
                    def destroyApproval = input message: "Do you want to proceed with Terraform Destroy?", 
                                               parameters: [booleanParam(name: 'Proceed', defaultValue: false, description: 'Approve Destruction')]
                    
                    if (!destroyApproval) {
                        error("Destroy operation stopped by user.")
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
        always {
            echo "Terraform deployment and destroy process completed."
        }
    }
}
