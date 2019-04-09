#!/bin/sh
promptName() {
	read -p 'Project name: ' NAME
}

cloneStater() {
	git clone https://github.com/ArcaneDigital/wordpress-scaffold.git $NAME && cd $NAME
}

setupGit() {
	rm -rfv .git

	read -p 'Do you want to set up a remote Git repository? (Y/n) ' -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		return 0
	fi

	read -p 'Enter the remote upstream repository (Example: https://github.com/ArcaneDigital/website-example.git): ' REPO
	echo "$REPO"

	git init && git remote add origin $REPO && git remote -v
}

installDependencies() {
	composer install && nvm use && npm install
}

setupEnv() {
	printf '\n\033[32mEnv setup!\033[0m\n'
}

promptName
cloneStater
setupGit
installDependencies
setupEnv

printf '\n\033[32mCompleted!\033[0m\n'