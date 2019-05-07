# jenkins-kubernetes


##pre-reqs
- kubernetes cluster (can use minikube)
- helm install jenkins/stable on the cluster

The plugin that is being used here is the [kubernetes-plugin](https://github.com/jenkinsci/kubernetes-plugin)

I have also modified the service account to be able to run kubectl commands
