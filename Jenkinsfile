env.PRODUCTION = '10.0.15.31'
node {
    def app
    stage('Build Docker Image') {
        checkout scm
        app = docker.build('prasantk/sample-node-app:latest')
    }
    
    stage('Publish to Docker Hub') {
        docker.withRegistry("https://index.docker.io/v1/", "dockerhub") {
            app.push('latest')
        }
    }

    stage('Deploy to Production') {
        docker.withServer("tcp://${PRODUCTION}:2376", 'production') {
            sh 'docker run -d prasantk/sample-node-app'
        }
    }
}