# Minecraft Mods Synchronizer
## About
This is an application, that helps you manage your modpacks using Yandex Disk shared folders.
> Other cloud storages will be supported later
## Installation
* Download the latest release
* Unpack the archive to any folder you want
* Add the folder to the PATH
* You're great! UwU
## Using CLI
You can use this application on Windows using **Command Line**
So, threre you are to open **Command Line** and input `syncer.exe no-gui <command> <arguments>`
Threre are the table of available commands:
|Command|Arguments|Action|
|:---:|:---:|:---:|
|set-path|<path>|Sets path of your minecraft root folder|
|view|No Args|Prints the table of your modpacks|
|add|name link loader|Creates a modpack. Link is a link to your shared Yandex Disk folder. Loaders is something like yandex|
|load|name|Erases mods in your 'mods' folder and downloads mods from given modpack|
|rename|oldName newName|Renames given modpack|
|change-link|name newLink|Changes the link to given modpack|
|change-loader|name newLoader|Changes the loader of given modpack|
|remove|name|Removes given modpack|
## Using GUI
GUI is not implemented yet. Sorry :(
