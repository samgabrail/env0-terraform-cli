# Overview

A repo to demo the different Terraform CLI commands

## Demo

### Code walk-through
1. `main.tf`
2. `variables.rf`
3. `terraform.tfvars`
4. `outputs.tf`

### `terraform init` command
1. Lock file creation
2. tree structure with `.terraform` folder with providers and modules
3. The `-upgrade` flag. Upgrade the `kreuzwerker/docker` provider to `3.0.1`

### `terraform validate` command
1. Show a successful output
2. Comment out the `docker_image` resource in `main.tf` to show a failed output

### `terraform plan` command
1. Show the changes that are about to happen
2. Discuss the `-out` flag

### `terraform apply` command
1. Show the plan and the prompt
2. Show the NGINX welcome page
3. Run `docker ps`
4. Talk about the `-auto-approve` flag
5. Show the state file created

### `terraform destroy` command
1. Show the plan and the prompt
2. Discuss the `-auto-approve` flag
3. Discuss the alternative to run `terraform apply -destroy`
4. Show the state file

### `terraform console` command
1. First show the `terraform state list` command
2. Try these commands:
    - var.image_name
    - "${var.image_name}:${var.image_tag}"
    - docker_image.nginx_image

### `terraform fmt` command
1. Break the formatting in some of the files and run the command

### `terraform taint` command
1. Run: `terraform taint docker_container.nginx_container`
2. Warning: This command is deprecated. The recommendation is to use the `-replace` option with terraform plan and apply instead. Using the `-replace` option gives you more visibility into the impact of the change before you apply it. With taint, you risk having another person run a new plan on your tainted object without your knowledge of the outcomes.
3. Run `terraform plan -replace docker_container.nginx_container`
4. Run `terraform apply -replace docker_container.nginx_container`

### `terraform workspace` commands
1. The terraform workspace command is used to manage workspaces. Workspaces are named containers for Terraform state that allow you to isolate and switch between different configurations and environments.
2. Run `terraform workspace list`
3. Run `terraform workspace new dev`
4. Run `terraform workspace new prod`
5. Run `terraform workspace list`
6. Make sure no containers exist otherwise run `terraform destroy`
7. Run the following:
```bash
terraform workspace select dev
terraform init
terraform apply -auto-approve
terraform workspace select prod
terraform init
terraform apply -auto-approve
```
8. Notice the file structure
9. Run `docker ps` to see the container names and the external ports
