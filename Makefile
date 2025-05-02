dev-apply:
	git pull
	terraform init
	terraform apply -var-file=environments/dev/main.tfvars

dev-destroy:
	git pull
	terraform init
	terraform destroy -var-file=environments/dev/main.tfvars

prod-apply:
	git pull
	terraform init
	terraform apply -var-file=environments/prod/main.tfvars

prod-destroy:
	git pull
	terraform init
	terraform destroy -var-file=environments/prod/main.tfvars