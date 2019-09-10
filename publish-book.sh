#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%s)
TRAVIS_BRANCH="$1"
IS_TRAVIS_PR="$2"

if [ "$#" -ne 2 ]; then
	echo "Please provide a branch (master, london, scotland)"
	exit 1
fi

if [[ $IS_TRAVIS_PR -ne "false" ]]; then
	echo "Pushed PR. Stopping"
	exit 1
fi

if [[ ! $TRAVIS_BRANCH =~ ^(master|develop)$ ]]; then
	echo "Pushed to non-deployable branch. Stopping"
	exit 1
fi

if [ $TRAVIS_BRANCH == "master" ];then
	REPO_NAME="syllabus"
else
    REPO_NAME="syllabus-$TRAVIS_BRANCH"
fi

git clone git@github.com:Migracode-Barcelona/$REPO_NAME.git
cp -a _book/* ./$REPO_NAME
cd $REPO_NAME
rm migrabot-key migrabot-key.enc
git config --global user.email "kabaros+migracode@gmail.com"
git config --global user.name "Migracode bot"
git config --global push.default simple
git add . --all
git commit --allow-empty -m "Rebuild on $DATE"
git push
