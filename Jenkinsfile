pipeline {
    agent {
        label 'jenkins-s1'
    }

    stages {
        stage("checkout") {
            steps {
                checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abhishek-balaji-2025/company-project-CD-pipeline.git']])
            }
        }

        stage("Docker-pull-image") {
            steps {
                sh 'echo "docker-pull-image"'
                sh 'docker pull abhishekbalaji/practice:v1'
            }
        }

        stage("deploy-nginx-ingress-controller") {
            steps {
                sh 'echo "deploying nginx ingress controller"'
                sh 'kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/baremetal/deploy.yaml'
            }
        }

        stage("deploy ingress rules") {
            steps {
                sh 'echo "deploying ingress-rules"'
                sh 'kubectl apply -f manifests/nginx-ingress-rules.yaml'
            }
        }

        stage("kubctl-deploy-microservice") {
            steps {
                sh 'echo "deploying microservice from manifest files"'
                sh 'kubectl apply -f manifests/deploy-simple-microservice.yaml'
            }
        }

        stage("rollout-status") {
            steps {
                sh 'echo "checking rollout status"'
                sh 'kubectl rollout status deployment/deploy-webpage'
            }
        }
    }
}