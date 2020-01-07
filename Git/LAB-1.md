![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# LAB # 1 - Clone/Create Repo


### There are multiple ways to create repositories, for this exercise we will cover two methods.

- Create empty repo
- Cloning
- Init new repo
## Create repo

- Create empty repo in-order to check-in the code 

*Note: Use your own Github userID/Password and repo name must match used later in this lab(my_tf_course)*
```bash
read -p "GitHub_Username: " GitUSER
read -p "Git Repo Name: " GitRepoName


curl -u $GitUSER https://api.github.com/user/repos -d '{"name":"'${GitRepoName}'","description":"This project is a test"}'
```

## Cloning

- Clone course repository and rename it
```bash
git clone https://github.com/imrannayer/tf_course my_tf_course
```
- Cleanup source Git origin
```bash
cd my_tf_course
rm -fr .git
git init
```

- Add empty file/directory 
```bash
cd my_tf_course
mkdir my_test_code
cd my_test_code
echo "This is random # $RANDOM" > my_random_code.txt
git status
```

- Commit your change for your local repo *(change location if you are not using home directory)*
```bash
cd ~/my_tf_course
git add my_test_code
git commit -m "My first change" 
```

- Set remote repo *URL* to your Git repo 
    - Use your github username
    - new_repo = my_tf_course.git

```bash
git remote add origin git@github.com:username/my_tf_course.git
git push -u origin master
```
