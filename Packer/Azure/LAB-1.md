# Create Azure Custom Image via Packer

### What you will learn from this hands-on activity

- Create Azure Resource Group 
- Learn Packer template for creating custom image 
- Launch Azure VM from custom image

Hashicorp Packer allows building of Automated Machine Images. It is important part of puzzle for IaC as customer have different requirements for setting baseline for following standards.

Tool is easy to use and automates the creation of any type of machine images working with CI/CD tool.

Illustration below display life cycle of pipeline

![](https://miro.medium.com/max/1668/1*ktDtHwWBbIVlGG9bTvW6Xg.png)

All of these activities can be performed from Azure shell and this lab works with Bash method.

####  Create Azure Resource Group & Auth token

- Launch Azure Cloud shell and execute command below to create new Azure Resource Group

```bash 
az group create -n myResourceGroup -l eastus
```

- Create Azure credentials for Packer template
```bash
az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
```

An example of the output from the preceding commands is as follows:

```json
{
    "client_id": "f5b6a5cf-fbdf-4a9f-b3b8-xxxxxxxxxx",
    "client_secret": "0e760437-bf34-4aad-9f8d-xxxxxxxxxx",
    "tenant_id": "72f988bf-86f1-41af-91ab-xxxxxxxxxx"
}
```

- To authenticate to Azure, you also need to obtain your Azure subscription ID
```bash
az account show --query "{ subscription_id: id }"

```


### Create Azure custom image

- Upload or copy/paste provided JSON template file for creating custom image.

- Update following values from above step.
    - client_id
    - client_secret
    - tenant_id
    - subscription_id
- Execute packer builder command:
```bash
packer build azure-custom-webserver.json
```   

- Verify output from Packer for successful image creation. Also, verify the Azure Resource Group for image. 

Hint: RM name is defined in template.

### Launch Azure VM from custom image

- Launch Azure VM with custom image via cli command from cloud shell:

```bash
az vm create \
    --resource-group myResourceGroup \
    --name myVM \
    --image myPackerImage \
    --admin-username azureuser \
    --generate-ssh-keys
```

- Once VM is created, open port 80 for http access

```bash
az vm open-port \
    --resource-group myResourceGroup \
    --name myVM \
    --port 80
```

- Can you access web url using public IP?

#### Cleanup 

- Terminate the VM created with following cli cmd:
```bash
az vm delete  --resource-group myResourceGroup     --name myVM
```
Note: If you different name was used, change your name to match your environment.

- Delete all resources created under Azure RM:
```bash
az  resource list --output=table

az group delete --name  myResourceGroup
```


#### Summary

- Learned how to create user token
- Learned how to create custom image
- Launch VM from custom image

