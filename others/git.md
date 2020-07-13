# Github

## Create a new project in Github



## Fork and Clone an existing project from Github

We use fork to copy an existing Github repository into out Github account
We use clone to copy an existing Github repository into our laptop
If we don't fork first, for sure we can clone any repository from others, but if they don't give privileges we will not be able to push the changes, that's why we always fork the repositories

To fork a repo:

To clone a repo:


## How to publish your website in Github.io

# Git Branching and merging

## Git Branching

You have been using git to track the changes you make to your exercises project. Each time you commit, you save a copy of your files.

![Visualization of git commits](../assets/git-branch-1.png)

When you create a new branch, you create a separate line of commits.

![Visualization of a git branch](../assets/git-branch-2.png)

With branches, you can work on two copies of your project and switch back and forth.

![Visualization of commits in two git branches](../assets/git-branch-3.png)

Complete exercise 9 from the [exercise project](https://github.com/Migracode-Barcelona/html-css-git-exercises) to learn how to use git branches.

> If you want to go deeper, read this article on [how git branching works](https://www.atlassian.com/git/tutorials/using-branches).


## Git Merging

Last week you used Git to create a branch so that you could work on two different copies of your project at the same time.

![Visualization of commits in two git branches](../assets/git-branch-3.png)

This week you will learn how to merge your changes in one branch back to your master branch.

![Visualization of merging one branch into another](../assets/git-merge.png)

Complete exercise 18 from the [exercise project](https://github.com/Migracode-Barcelona/html-css-git-exercises).

## Git Merge Conflicts

Last week you used Git to merge your changes from one branch back into your master branch.

![Visualization of merging one branch into another](../assets/git-merge.png)

Sometimes Git can not automatically merge one branch into another, because each branch has modified the same line of code. Git does not know which version of the line is the correct one. When this happens, we have a "merge conflict".

![Visualization of a merge conflict](../assets/git-merge-conflict.png)

As a developer, you have to tell Git which version of the line of code is correct.

Complete exercise 28 from week 3 of the [HTML, CSS and Git Exercises](https://github.com/Migracode-Barcelona/html-css-git-exercises) to learn how to resolve a merge conflict.


## Git Conflicts

As a professional, you'll usually need to work alongside other coders to build an app or website. We use version control to coordinate changes and manage any conflicts that arise. [Git](https://git-scm.com/) is a version control system which helps us merge code that we've been working on separately into one common codebase.

To manage conflicts, we will need a common code base in which all changes are coordinated. When working on our own, we'll make our changes in `branches` to keep the code separate. Then we'll learn how to refresh your individual `branch` with the common code base, and prepare your changes to be merged.

> Exercise: Get together in pairs and select a "leader". The leader should fork [this repository](https://github.com/CodeYourFuture/first-git-conflict) to their GitHub account. The other person should then fork the leader's repository. Both students should then clone their own personal forks locally.

Now that you have the project set up on your computer, you need a place to safely make changes without effecting the common code base. To do this, we'll navigate to our project in the Terminal and create a new branch:

```bash
cd <your-project-directory>
git checkout -b my-first-branch
```

When you commit changes on this branch, your changes will be saved separately from the common code base. This way both team members can make changes at the same time.

> Exercise: Add your name and a sentence about yourself to the `index.html` file. Then `git add` and `git commit` to commit to your personal branch.

Now you have two branches: `master` and `my-first-branch`. These branches have _diverged_, which means you have changes in one that don't appear in the other. You can check this by running `git checkout master`, then looking at your `index.html` file.

When you're done, run `git checkout my-first-branch` to go back to the branch with your changes. Git saves your changes in both branches and lets you switch between them. That's why we call it "version control". It saves different versions so you can switch between them.

Right now, your new branch only exists on your computer. Let's push it up to GitHub so you can see it in your profile.

```bash
git checkout my-first-branch
git push -u origin my-first-branch
```

Now both students in each pair, the "leader" and the other student, should have branches with changes. Now let's try to merge these changes together into the "leader's" master branch.

> Exercise: Browse to the "leader's" GitHub repository and open a new Pull Request. The Pull Request should ask to merge your `my-first-branch` branch into the "leader's" `master` branch. Ask a mentor for help if you have trouble figuring out how to issue a Pull Request. When both students have issued a Pull Request to the correct place, merge _one_ of them but not the other.

Congrats, you've merged one student's changes with the common code base in the `master` branch. If you check the other Pull Request, you'll see you have a problem. It can't be merged automatically because there's a conflict. Why?

Conflicts emerge whenever the same file has been edited, and git can't determine what changes should be kept and what changes should be discarded. A human -- that's you -- needs to step in and sort it out. To help us, git writes into our code so we can see where it is confused. Here's an example of a merge conflict in our code:

```diff
<<<<<<<  HEAD
+   <h2>Mozafar</h2>
+   <p>I am a mentor at CodeYourFuture.</p>
=======
-   <h2>Daniel</h2>
-   <p>I like to ride bikes</p>
>>>>>>> my-first-branch
```

To resolve a conflict, we decide which lines to keep and which lines to remove. When we're done, we remove the extra lines that git added (`<<<<< HEAD`, `========` and `>>>>>>>`).

Let's see how we can resolve this conflict with your branches. First we need to fetch the latest changes from the leader's `master` branch. If you're the **leader**, just do:

```sh
git checkout master
git pull
```

If you're the **other student**, you need to set up the remote and pull from that master:

```sh
git checkout master
git remote add upstream <your-leaders-git-repository-url>
git pull upstream master
```

Now everyone's `master` branch should include the Pull Request that was merged. Whichever student still needs to get their Pull Request merged can bring those changes into their branch like this:

```sh
git checkout my-first-branch
git merge master
```

You probably received a **merge conflict**.

> Exercise: Follow the steps we discussed before about how to resolve a merge conflict by editing the file. Make sure both students changes are included in the final version. When you're done, use `git add`, `git commit` and `git push` to share your changes with GitHub. If everything has gone correctly, you can now merge the Pull Request.

Now everyone can sync their changes. If you're the **leader**, just do:

```sh
git checkout master
git pull
```

If you're the **other student**, do this:

```sh
git checkout master
git pull upstream master
```

> Exercise: As a group, discuss why the `git pull` command is different for the **leader** and the **other student**.

> Exercise: Try to do the pull requests again, but this time switch the pull requests so that the other student must manage the merge conflict.

If you're feeling confused, don't worry. Version control is one of the most difficult things you'll learn and we'll be going over it again and again and again.