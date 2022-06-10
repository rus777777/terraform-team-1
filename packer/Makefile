build: 
		terraform init && terraform apply -auto-approve
		packer init . && packer fmt . && packer validate . && packer build .
		terraform destroy -auto-approve
		

