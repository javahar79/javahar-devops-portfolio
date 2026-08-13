# last_verified: 2026-08-12 · Kubernetes (kubectl n/a)

# My first kubectl commands — deploy a pod, poke at it, then tear it down.
# Ran these against a local minikube cluster.

kubectl create deployment hello --image=nginx:latest     # deploy a pod
kubectl get pods                                        # see what's running
kubectl describe deployment hello                       # details + events
kubectl logs deployment/hello                           # what the app printed
kubectl delete deployment hello                         # clean up
kubectl get pods                                        # confirm it's gone