#!/bin/sh
#!/bin/bash

. ~/.nvm/nvm.sh
. ~/.profile
. $(brew --prefix nvm)/nvm.sh  # if installed via Brew

printf '\n\033[34mWelcome to the WordPress Scaffold Installer\033[0m \e[1;37m(Version 1.0.0)\e[0m \n\n'

promptName() {
	read -p 'Project name: ' NAME
}

cloneStater() {
	printf '\n\033[36mCloning Scaffold!\033[0m\n\n'
	git clone https://github.com/ArcaneDigital/wordpress-scaffold.git $NAME && cd $NAME
}

setupGit() {
	rm -rfv .git
	read -p 'Do you want to set up a remote Git repository? (Y/N) ' -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		printf '\n\033[36mCommitting Initial files!\033[0m\n\n'
		git init && git add . && git commit -m 'init'
		return 0
	fi
	read -p 'Enter the remote upstream repository (Example: https://github.com/ArcaneDigital/website-example.git): ' REPO
	echo "$REPO"
	printf '\n\033[36mCommitting Initial files!\033[0m\n\n'
	git init && git remote add origin $REPO && git remote -v && git add . && git commit -m 'init'
}

installDependencies() {
	printf '\n\033[36mInstalling Dependencies!\033[0m\n\n'
	composer install && nvm use && npm install
	printf '\n\033[36mCommitting Dependencies!\033[0m\n\n'
	git add . && git commit -m 'Dependencies'
}

setupEnv() {
	printf '\n\033[36mEnv setup!\033[0m\n\n'
}

valetCommand() {
	read -p 'Do you want to set up a Valet for this project? (Y/N) ' -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		return 0
	fi
	printf '\n\033[36mSetting up Valet!\033[0m\n\n'
	cd $NAME && valet start && valet link $NAME && valet secure $NAME
	printf '\n\033[34mVisit https://'$NAME'.test\033[0m\n'
}

promptName
cloneStater
setupGit
installDependencies
#setupEnv
#valetCommand

printf '\n\033[32mWordPress Scaffold Setup Completed!\033[0m\n\n'
