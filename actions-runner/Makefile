NAMESPACE=actions
GITHUB_TOKEN=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

cert-manager:
	helm install \
      cert-manager jetstack/cert-manager \
      --namespace cert-manager \
      --create-namespace \
      --version v1.11.0

secret:
	kubectl create ns $(NAMESPACE)
	kubectl create secret generic controller-manager -n $(NAMESPACE) --from-literal=github_token=$(GITHUB_TOKEN)

action-runner-controller:
	helm install --namespace $(NAMESPACE) --wait actions-runner-controller actions-runner-controller/actions-runner-controller

runner:
	kubectl apply -f runner.yaml