# Minecraft Mods Synchronizer
## About
This is an application, that helps you manage your modpacks generally using Yandex Disk shared folders.
> Other cloud storages will be supported later
You can also use:
* List of downloading links hosted on Pastebin. **link should be given in format: https://pastebin.com/raw/<paste_id>**
```PastebinFormat
<modname1> <link1>
<modname2> <link2>
<modname3> <link3>
...
```
## Installation
* Download the latest release
* Unpack the archive to any folder you want
* Add the folder to the PATH
* You're great! UwU
## Loader Names
|Loader|Name|
|:---:|:---:|
|Yandex Disk|yandex|
|Pastebin|pastebin|
## Using CLI
You can use this application on Windows using **Command Line**
So, threre you are to open **Command Line** and input `syncer.exe no-gui <command> <arguments>`
Threre are the table of available commands:
|Command|Arguments|Action|
|:---:|:---:|:---:|
|set-path|<path>|Sets path of your minecraft root folder|
|view|No Args|Prints the table of your modpacks|
|add|name link loader|Creates a modpack. Link is a link for your loader. Loaders are given in table, given higher|
|load|name|Erases mods in your 'mods' folder and downloads mods from given modpack|
|rename|oldName newName|Renames given modpack|
|change-link|name newLink|Changes the link to given modpack|
|change-loader|name newLoader|Changes the loader of given modpack|
|remove|name|Removes given modpack|
## Using GUI
GUI is not implemented yet. Sorry :(
