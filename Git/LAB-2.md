![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# LAB # 1 - Git Branching  


### With this hands-on lab you will work with Git Branching.

- Create Branch from master
- Check/modify code for new branch
- Commit and push changes to dev branch 



## Create Branch from master

- Use repo my_tf_course created in Lab1
```bash
cd my_tf_course
git status
```
- Verify your working branch
```bash
git branch # this lists local branches
git branch -r # this lists remote branches
git checkout -b my_tf_course_dev
git branch
```

- Add empty file/directory 
```bash
cd my_tf_course
mkdir my_test_code_rel0
cd my_test_code_rel0
echo "This is random # $RANDOM" > my_random_code_rel0.txt
git status
```

- Commit your change for your local branch repo *(change location if you are not using home directory)*
```bash
cd ~/my_tf_course
git add my_test_code_rel0
git commit -m "First Branch Commit" 
git push origin my_tf_course_dev
```

### What happened? do you see your changes on GitHub platfrom? 
