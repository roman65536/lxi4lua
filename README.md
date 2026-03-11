This a stand alone "copy" for LUA of liblxi and lxi-tools. 
lxi-tools is a great thing, however it can't be used in cli lua or when lua is embedded such as in lualatex. 
The lxilua.c is a copy from lxi-tools, just added to use it as library of lua.
test.tex is an example how to use "lxit" Library with LuaLaTeX. It's just a query of "*IDN?" but it shows the potential. 
To compile it use "lualatex --shell-escape test.tex". It will ask you for the Name or IP address of the device and generates pdf with those informations.

 
