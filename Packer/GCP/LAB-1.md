# Create GCP Custom Image via Packer

### What you will learn from this hands-on activity

##### Note: This LAB is partial complete and still in development 

- Install Packer on cloud shell
- Authenticate gcloud with GCP service account
- Review and launch GCP packer template
- Verify Packer image created for GCP 


Hashicorp Packer allows building of Automated Machine Images. It is important part of puzzle for IaC as customer have different requirements for setting baseline for following standards.

Tool is easy to use and automates the creation of any type of machine images working with CI/CD tool.

Illustration below display life cycle of pipeline

![](https://miro.medium.com/max/1668/1*ktDtHwWBbIVlGG9bTvW6Xg.png)

All of these activities can be performed from GCP shell and this lab works with Bash method.

####  Install Packer on cloud shell & authenticate with service account

- Launch GCP Cloud shell and install packer

Note: *GCP Cloud shell does not retain any additional/extra binaries, hence you will have to install packer again*



```bash 
sudo apt install packer -y
packer --version
```

- Verfiy GCP Project ID and Project name

```bash
gcloud auth list
gcloud config list project
PROJECT=$(gcloud config get-value project)
echo $PROJECT
```


- Enable GCP API's



```bash
gcloud services enable sourcerepo.googleapis.com
gcloud services enable cloudapis.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable servicemanagement.googleapis.com
gcloud services enable storage-api.googleapis.com
gcloud services enable cloudbuild.googleapis.com
```

### Review and launch GCP packer template

- Update template with your GCP project ID in template file

```bash
packer validate gcp-custom-webserver.json
```

- Build Packer image with GCP (This step might fail - bug is being looked at!)


```bash
packer build gcp-custom-webserver.json
```




#### Cleanup 



#### Summary

- Learned how to create user token
- Learned how to create custom image
- Launch VM from custom image

