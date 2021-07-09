# Terraform Course

## Assumptions 
- You have understanding of cloud environment you are deploying resources to.
- These labs will create resource which may have cost associated. Check pricing before creating resources. 

## How to configure 
- LabSetup.txt have details on how to setup Lab envs. 

## Lab Details

### 01-A-simple

This is simple lab. Sort of Hello World kind of code. It will deploy single resource.
Once you are done drop the resource.

### 01-B-simple

- This Lab creates resource. It has few lines disabled. Once your resource is created uncheck those lines and re-run the code.
- It shows idempotent property of TF. 
- After completing this Lab drop the resource using terraform destroy command.

### 02-A-variables

- This lab shows how to use variables in TF. 
- Drop the resource using terraform destroy after completing this lab.

### 02-B-variables_tfvars

- This Lab shows how to pass values to variables using terraform.tfvars file.
- Drop the resource using terraform destroy after completing this lab.

### 02-C-variable_types

- This Lab shows how to use list and maps variables.
- Drop the resource using terraform destroy after completing this lab.

### 03-resource-reference

- This lab shows how you can refer different resources in same terraform code. 
- Drop the resource using terraform destroy after completing this lab.

### 04-Output

- This Lab shows how to output exported values of resouerce. Understanding of this lab is pre-req for next lab
- Drop the resource using terraform destroy after completing this lab.

### 05-remote-state

- This lab shows how to use Terraform remote state. 
- Run Lab in folder A-XXX first. It will create resource. 
- Create resource in B-XXX using values from resource created in A-XXXX folder. 
- Code will show it is getting id of refered resource from A-XXX folder.
- Drop the resource using terraform destroy after completing this lab.

### 06-modules

- This lab shows how to create modules. 
- There are three folders 
    1) modules
    2) my-1-XXXX
    3) my-2-XXXX
    4) registry
    
    modules directory have module code. my-1-XXX and my-2-XXX is creating resources using module in modules directory.

- registry directory has terraform code showing how use modules hosted on public registry
- Drop the resource using terraform destroy after completing this lab.

### 07-Multi Region
- This lab demonstrates how to deploy multi-regional or different types oof resource.
- Drop the resource using terraform destroy after completing this lab.

### 08-Loops
- This lab demonstrates how to different types of loops in Terraform.
- Drop the resource using terraform destroy after completing this lab.

### 09-backend
- This lab demonstrates how to use backends like object storage buckets.
- Drop the resource using terraform destroy after completing this lab.

### smoke 
Folder has test code to verify your local settings.  



# Gitpod Setup
To get started, follow these steps:
- Create Gitpod account [https://www.gitpod.io/](https://www.gitpod.io/)
- Install Browser Extension [https://www.gitpod.io/docs/browser-extension](https://www.gitpod.io/docs/browser-extension)
- Refresh code repo then you will be seeing `Gitpod` button
- `[optional]` Configure below listed environment variables [https://gitpod.io/variables](https://gitpod.io/variables)
```
AWS_DEFAULT_REGION=<value>
AWS_ACCESS_KEY_ID=<value>
AWS_SECRET_ACCESS_KEY=<value>
AZ_USER=<value>
AZ_PASS=<value>
GCP_SERVICE_ACCOUNT=<value>
GCP_KEY_FILE=<value>
```

## Development Container Setup
To get started, follow these steps:
- Install and configure Docker for your operating system [https://code.visualstudio.com/docs/remote/containers#_installation](https://code.visualstudio.com/docs/remote/containers#_installation)
- Install Visual Studio Code extension - *Remote Development* (`ms-vscode-remote.vscode-remote-extensionpack`)
- Open an existing folder in a container [https://code.visualstudio.com/docs/remote/containers#_quick-start-open-an-existing-folder-in-a-container](https://code.visualstudio.com/docs/remote/containers#_quick-start-open-an-existing-folder-in-a-container)