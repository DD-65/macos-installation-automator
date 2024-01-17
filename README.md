# Automate the installation of apps

I coded this because I downloaded a bunch of dmgs and pcks from the internet and didn't want to spend hours installing all of them manually.. Putting it here in case someone else faces the same problem (and doesn't just do a quick google search on how to automate stuff like me)

## Description
### codesigner
finds .app files in the directory it is in (and one subdirectory - can be set to any value) and asks if they should be signed (codesign -deep -force)
### pkg-installer
finds .pkg files in the directory it is in and asks if they should be installed
### dmg-installer
asks for the filepath (with extension) of a .dmg file and installs it automatically (install path needs to be changed -> TODO)

## Installation
Put the files in the directory your .app/.dmg/.pkg files are in, make then executable with chmod and run them
