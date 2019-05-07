def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, serviceAccount: 'jenkins-helm', containers: [
  containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true),
]) {
	node(label) {
		def myRepo = checkout scm
	    def gitCommit = myRepo.GIT_COMMIT
	    def gitBranch = myRepo.GIT_BRANCH
	    def shortGitCommit = "${gitCommit[0..10]}"
	    def previousGitCommit = sh(script: "git rev-parse ${gitCommit}~", returnStdout: true)
	    
	    stage('Create configmap') {
	    	container('kubectl') {
		      	sh """
	            pwd
	            echo "GIT_BRANCH=${gitBranch}" >> /etc/environment
	            echo "GIT_COMMIT=${gitCommit}" >> /etc/environment
	            """
	            sh "./create-payload.sh"
	            sh "ls"
	            sh "cat index.html"

        	}
	    }
		stage('Run kubectl') {
		    container('kubectl') {
		    	sh 'ls'
		        sh "kubectl get po"
		    }
	    }
	}
}