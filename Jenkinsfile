pipeline
{
    agent any
    stages
    {
        stage( "clean" )
        {
            steps
            {
                script {
    def containerExists = sh(script: 'docker ps -a -q', returnStdout: true).trim()
    if (containerExists) {
        // Stop and remove containers
        sh "docker stop $containerExists"
        sh "docker rm $containerExists"
    }

    def imageExists = sh(script: 'docker images -q', returnStdout: true).trim()
    if (imageExists) {
        // Remove imageExists
        sh "docker rmi $imageExists"
    }

    // Clean workspace
    sh 'rm -rf /var/lib/jenkins/workspace/Docliner/*'
}

            }
        }
        stage( "Clone" )
        {
            steps
            {
                sh ' git clone https://github.com/Shashankp21/docline.git '
            }
        }
        stage( "Build" )
        {
            steps
            {
                // sh ' mv /var/lib/jenkins/workspace/Docliner/* /home/Docker ' 
                sh ' docker build -t imagejav /var/lib/jenkins/workspace/Docliner/Docliner '
            }
        }
        stage( "Run" )
        {
            steps
            {
                sh ' docker run -d imagejav '
            }
        }
    }

    post {
        success {
            // Do something on successful build
            echo 'Build successful!'
        }
        failure {
            // Do something on build failure
            echo 'Build failed!'
        }
    }
}
