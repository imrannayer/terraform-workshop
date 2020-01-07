![alt text](https://camo.githubusercontent.com/fb782da4019ab66eeea35cc9b9ce73b2438b1688/687474703a2f2f646f632e72756c746f722e636f6d2f696d616765732f6769746875622d6c6f676f2e706e67 "Logo Title Text 1")

# LAB # 1 - Git Branching - Branching Merge


### With this hands-on lab you will work with Git Branching and merge the changes with master.

- Commit changes with dev branch for master
- Push changes to master



## Merge dev branch with Master

- Clone or leverage course repo my_tf_course 
```bash
cd my_tf_course
git status
```
- Verify your working branch
```bash
git branch # this lists local branches
git branch -r # this lists remote branches
git checkout master
git branch
```

- Merge Dev branch with master & push to origin 
```bash
git merge my_tf_course_dev
git push origin master
git branch
git status
```


### What happened? do you see your changes on GitHub platfrom? 
