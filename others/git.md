# Github: a complete guide (under construction)


* [Github Basics](#github-basics)
    * [Create a new project in Github](#create-a-new-project-in-github)
    * [Fork and Clone an existing project from Github](#fork-and-clone-an-existing-project-from-github)
    * [Commit and push your changes to Github](#commit-and-push-your-changes-to-github)
    * [How to publish your website in Github.io](#how-to-publish-your-website-in-github.io)
    * [Basic Git Commands](#basic-git-commands)
* [Advanced]
    * [What is a remote?](#what-is-a-remote)
    * [Adding a remote](#adding-a-remote)
    * [Branches](#branches)
    * [Creating a Pull Request (PR)](#creating-a-pr)

# Github Basics

## Create a new project in Github

See the comlete tutorial on [Github: Create a repo](https://docs.github.com/en/github/getting-started-with-github/create-a-repo)

Instead of cloning the repo that you created in Github, you can also initiallize the repo using the command line/terminal by followint the [Add a project using the command line](https://docs.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line)

## Fork and Clone an existing project from Github

We use fork to copy an existing Github repository into out Github account
We use clone to copy an existing Github repository into our laptop
If we don't fork first, for sure we can clone any repository from others, but if they don't give privileges we will not be able to push the changes, that's why we always fork the repositories

To fork a repo:

Firstly you need to click the "Fork" button:

![Fork Button](./assets/making-a-pull-request/fork-button.png)

Then you should be brought to your new fork (notice how the repo title changes):

![Forked repo](./assets/making-a-pull-request/forked.png)

[Github:Fork a repo](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo)

To clone a repo:

Now you can clone from your fork by copying the URL here:

![Clone from fork](./assets/making-a-pull-request/clone-fork.png)

The command to clone is:

```
git clone URL_YOU_JUST_COPIED
```

## Commit and push your changes to Github

Once you have your repository
- `git add .` // track changes on files (create, remove, modify)
- `git commit -m “message”` // save changes
- `git push`  // upload your commits from origin (your laptop) to the remote (Github) in branch master (the default)

## How to publish your website in Github.io

1. Now all that remains is to publish your website! Still under
   `http://github.com/your-username/your-repository-name`, find the settings
   icon in the top right corner.

<div style="text-align: center;">
  <img
    src="assets/lesson-0/repo-settings.png"
    width="200"
    alt="Repo settings"
  />
</div>

2. Find the section named "Github Pages" and select "master branch" in source,
    then hit "Save".

<div style="text-align: center;">
  <img
    src="assets/lesson-0/repo-settings-pages.png"
    width="200"
    alt="Repo settings - Github pages"
  />
</div>

3. Wait a few minutes, then refresh the page and come back to the Github Pages
    section. You should see a green bar saying "Your site is published at
    `http://github.com/your-username/your-repository-name`". Click the link,
    verify that your website is there, then share it with your CYF class!


## Remote

Git has a concept of a "remote". These are other git repositories that can be connected to over the internet. You can push or pull code changes from them. Remotes have a *name* and a *URL*. 

All the remotes that you will use at Migracode are hosted on GitHub, so have a github.com URL.

When you clone a repo from GitHub, the default remote is named `origin` and the URL is set to that of the GitHub repo.

You can view the remotes you have set up with:

```
git remote -v
```


## Basic Git commands

Configuration commands:

- `git config --global user.name "John Doe"`
- `git config --global user.email johndoe@example.com`
- `git config --list`

Commands to create a project:

- `git init *project name*`  //initialize GIT repository in an empty directory (locally)
- `git add .` //track changes on files (create, remove, modify)
- `git commit -m “message”` //save changes
- `git remote add origin *https://github.com/yourusername/yourrepo*`
- `git push -u origin master` //upload origin (my laptop) to the server in branch 
- `git status` //show current status
- `git clone *url*` //download files from URL with a file .git


# Advanced


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



## Merging and advanced Git commands

- `git fetch` //fetch latest changes from origin and all branches (no merge)
- `git pull`  //fetch latest changes from origin and all branches (with merge)
- `git merge`

Branches:

- `git branch test` //creates a new local branch
- `git checkout test` //move to branch test
- `git checkout master` //move to branch master
- `git checkout -b test` //create a new local branch and move into it
- `git push origin test` //push the branch and all commits to the server
- `git branch -d test` //remove a local branch
- `git checkout -b test origin/test`
- `git fetch --all`   //to get all branches from server



# Making a Pull Request


## Adding a Remote

Follow these instructions if you are getting an permission error when pushing your changes. If you have cloned the original repo *before* forking, you'll need to follow these instructions. You can check this by running `git remote -v`. If the output looks something like:

```
origin git@github.com:CodeYourFuture/css-skin.git (fetch)
origin git@github.com:CodeYourFuture/css-skin.git (push)
```

then you have cloned before forking. The key is that the `origin` remote is pointing to a CodeYourFuture URL. Don't worry, we can fix it!

The first step is to fork the original repo. Follow the first 2 steps from [forking instructions](#how-to-fork-a-github-repo) above.

Now, instead of cloning the fork (you have already cloned), you need to add it as a remote.

Run:

```
git remote add fork URL_YOU_COPIED_FROM_FORK
```

This will add a new remote called `fork` that points to your new fork. To check this, run `git remote -v` again. You should see both the `origin` and `fork` remotes.

Now that you have your `fork` remote you can push to it (instead of the `origin` remote, which will error) by running:

```
git push fork
```

You'll need to remember to add the `fork` *every time you push*.

## Creating a PR

So you've done your homework, you've committed your changes and are ready to make a PR. Congrats! 🎉🎉🎉

At this point you should have followed the instructions either to [fork the original repo](#how-to-fork-a-github-repo) or [added a remote to your fork](#adding-a-remote). If you haven't make sure you read those sections first.

You will need to push to your fork. If you forked and then cloned (as in the [how to fork instructions](#how-to-fork-a-github-repo)) then you just need to run `git push`. If you [added a remote to your fork](#adding-a-remote), then you will need to run `git push fork`.

Next you need to go the original repo in your browser (probably starting with https://github.com/CodeYourFuture). Next click the Pull Requests tab:

![PR tab](./assets/making-a-pull-request/pr-tab.png)

Then click the New pull request button:

![New PR button](./assets/making-a-pull-request/new-pr-button.png)

Then click the "compare across forks" link:

![Compare across forks](./assets/making-a-pull-request/compare-across-forks.png)

Then click the "head fork" dropdown button:

![Head fork dropdown button](./assets/making-a-pull-request/head-fork-dropdown.png)

Then find your fork in the list and click it:

![Found head fork](./assets/making-a-pull-request/found-head-fork.png)

Then click the Create pull request button:

![Create PR](./assets/making-a-pull-request/create-pull-request-1.png)

Almost there! Now fill out the PR form. Give it a sensible title and an (optional) description:

![PR form](./assets/making-a-pull-request/pr-form.png)

And finally click the Create pull request button at the bottom of the form:

![Create pull request](./assets/making-a-pull-request/create-pull-request-2.png)

That's it! You created your PR!

![Created PR](./assets/making-a-pull-request/created-pr.png)

## Resources

1. [Creating a pull request from a fork](https://help.github.com/articles/creating-a-pull-request-from-a-fork/)
