# WordPress Scaffold Installer
Install wizard for WordPress Scaffold

## Requirements
- composer
- nvm via brew
- npm

## Using the installer

### Enter your working directory

Example
```
cd code/
```

### Run installer in working directory

```
sh -c "$(curl -fsSL https://raw.github.com/ArcaneDigital/wordpress-scaffold-installer/master/installer.sh)"
```

This command will create a directory once you fill out the project name prompt

### Creating an alias

`cd ~`

`nano .bash_profile`

Add the following to your `.bash_profile` file
```
alias wpscaffold='sh -c "$(curl -fsSL https://raw.github.com/ArcaneDigital/wordpress-scaffold-installer/master/installer.sh)"'
```

Run the following
`source .bash_profile`

Restart terminal 
