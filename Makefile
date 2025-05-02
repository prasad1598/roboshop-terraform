dev-apply:
	git pull
	terraform init
	terraform apply -auto-approve -var-file=environments/dev/main.tfvars

dev-destroy:
	git pull
	terraform init
	terraform destroy -auto-approve -var-file=environments/dev/main.tfvars

prod-apply:
	git pull
	terraform init
	terraform apply -auto-approve -var-file=environments/prod/main.tfvars

prod-destroy:
	git pull
	terraform init
	terraform destroy -auto-approve -var-file=environments/prod/main.tfvars