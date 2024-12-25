# Replace <namespace> with your namespace
NAMESPACE=actions-runner-system

# Get all pod names in the namespace
kubectl get pods -n $NAMESPACE -o jsonpath='{.items[*].metadata.name}' | tr ' ' '\n' | while read POD; do
  echo "Removing finalizers from $POD"
  kubectl patch pod $POD -n $NAMESPACE -p '{"metadata":{"finalizers":null}}'
done