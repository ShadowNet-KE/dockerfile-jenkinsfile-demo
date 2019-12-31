node {
 
 //commit_id will be also the tag for docker registry
 def commit_id
 
 // Checkout and get the commit_id
 stage('Preparation') {
  checkout scm
  sh "git rev-parse --short HEAD > .git/commit-id"
  commit_id = readFile('.git/commit-id').trim()
 }
 
 stage('test') {
  // Build the docker image and run tests
  // If needed you can define a Dockerfile suitable for testing
  def myTestContainer = docker.build("test-python", "--no-cache -f ./dockerfiles/Dockerfile .")
  myTestContainer.inside {
   sh 'python ./tests/tests.py'
  }
 }
 
 stage('push to docker registry') {
  // build and push to docker registry
  // 'dockerhub' is an id in our jenkins installation which has the credentials to use with
  // dockerhub
  docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
   // You will need to change also the 'username' with your dockerhub username
   // And 'dockerfile-jenkinsfile-demo' with your dockerhub image name 
   def app = docker.build("username/dockerfile-jenkinsfile-demo:${commit_id}", "--no-cache -f ./dockerfiles/Dockerfile .").push()
  }
 }       
 
}
