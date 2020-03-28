![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# GIT tutorial

##### *Note: Git client or GUI should be installed on client workstation - all git command*


In this tutorial we will work with Git - GitHub is version control platform that allows multiple users to modify and update code with revision control.

In this tutorial we will create local repository, create README.md document and sync repository with GitHub

#### 1 - Create new repo  

You can create GitHub repo two ways, using GitHub via browser or via REST-API

##### Repo via Web browser

1. Sign into your GitHub account
2. Open master repo: https://github.com/imrannayer/tf_course
3. Fork repo to your github account

##### Repo via REST-API

Execute command below to create REPO:

```bash
## Change username to your GitHub account and change Project name ##
curl -u 'your-github-user' https://api.github.com/user/repos -d '{"name":"my_first_repo","description":"This project is a test"}'
```

Script to read userInput:

```bash
read -p "GitHub_Username: " GitUSER
read -p "Git Repo Name: " GitRepoName


curl -u $GitUSER https://api.github.com/user/repos -d '{"name":"'${GitRepoName}'","description":"This project is a test"}'
```

