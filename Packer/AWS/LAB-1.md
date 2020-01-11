# Create AWS Custom Image via Packer

### What you will learn from this hands-on activity

- Login to AWS Cloud VM
- Learn Packer template for creating custom image 
- Launch AWS VM from custom image

Hashicorp Packer allows building of Automated Machine Images. It is important part of puzzle for IaC as customer have different requirements for setting baseline for following standards.

Tool is easy to use and automates the creation of any type of machine images working with CI/CD tool.

Illustration below display life cycle of pipeline

![](https://miro.medium.com/max/1668/1*ktDtHwWBbIVlGG9bTvW6Xg.png)

All of these activities can be performed from AWS shell and this lab works with Bash method.

####  Create AWS Resource Group & Auth token

- Login to AWS Cloud VM and clone repo 

```bash 
git clone https://github.com/imrannayer/tf_course.git
cd tf_course/Packer/AWS
ls aws-custom-webserver.json
```

- Verify AWS SDK/CLI is working

```bash
aws sts get-caller-identity
```

An example of the output from the preceding commands is as follows:

```table
----------------------------------------------------------------------------------------
|                                   GetCallerIdentity                                  |
+--------------+---------------------------------------------+-------------------------+
|    Account   |                     Arn                     |         UserId          |
+--------------+---------------------------------------------+-------------------------+
|  900550000000|  arn:aws:iam::900550000000:user/user1.user  |  AIDA5DLXXXXXXXXXXXXXX  |
+--------------+---------------------------------------------+-------------------------+
```


### Create AWS custom image

- Upload or copy/paste provided JSON template file for creating custom image.

- Execute packer builder command:
```bash
packer build aws-custom-webserver.json
```  

- Example Output

```
==> Builds finished. The artifacts of successful builds are:
2020/01/10 21:26:52 machine readable: amazon-ebs,artifact []string{"0", "builder-id", "mitchellh.amazonebs"}
2020/01/10 21:26:52 machine readable: amazon-ebs,artifact []string{"0", "id", "us-east-1:ami-088fa3d48430fd521"}
2020/01/10 21:26:52 machine readable: amazon-ebs,artifact []string{"0", "string", "AMIs were created:\nus-east-1: ami-088fa3d48430fd521\n"}
2020/01/10 21:26:52 machine readable: amazon-ebs,artifact []string{"0", "files-count", "0"}
2020/01/10 21:26:52 machine readable: amazon-ebs,artifact []string{"0", "end"}
us-east-1: ami-088fa3d48430fd521
--> amazon-ebs: AMIs were created:
us-east-1: ami-088fa3d48430fd521

```
- Verify output from Packer for successful image creation. Also, verify the AWS Resource Group for image. 


### Launch AWS VM from custom image

- Verify the image creation in AWS Console or via CLI:

```bash
aws ec2 describe-images --image ami-088fa3d4843xxxx
```

- Launch instance from Console or CLI



#### Cleanup 

- Terminate the VM created with following cli cmd:
```bash

aws ec2 describe-snapshots --owner self
aws ec2 deregister-image --image ami-088fa3d4843xxxx
aws ec2 delete-snapshot --snapshot-id snap-07791937bxxxx
```
Note: If you different name was used, change your name to match your environment.


#### Summary

- Learned how to create user token
- Learned how to create custom image
- Launch VM from custom image

