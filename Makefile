dev-apply:
	git pull
	terraform init -backend-config=environments/dev/dev_backend.tfvars
	terraform apply -auto-approve -var-file=environments/dev/main.tfvars -var token=$(token)

dev-destroy:
	git pull
	terraform init -backend-config=environments/dev/dev_backend.tfvars
	terraform destroy -auto-approve -var-file=environments/dev/main.tfvars -var token=$(token)

prod-apply:
	git pull
	terraform init -backend-config=environments/prod/prod_backend.tfvars
	terraform apply -auto-approve -var-file=environments/prod/main.tfvars -var token=$(token)

prod-destroy:
	git pull
	terraform init -backend-config=environments/prod/prod_backend.tfvars
	terraform destroy -auto-approve -var-file=environments/prod/main.tfvars -var token=$(token)