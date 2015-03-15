# Introduction

Lua (and some other projet like Love2d) evolves. Their API changes.

Some project exists to implement a newer API on older VM or older API on newer VM...
All compat layers I seen was only from 2 versions at a time.

# First Sample

The first sample was about the Lua5.1 - Lua5.2 environement changes.

<Fill me>

# Ideal Compat support

My idea is to be able to set information inside the code to annonce "This code was made for API vX"
When you want run this code :
1. You are exactly on the same version, then no problem
2. Your VM is newer than the code (you should have a compat layer to implement obsolete API)
3. You VM is older than the code (you should have a compat layer to implement new API)


# My solution

setup a common env
setup a specific set of function for each version (the ones that is not common)

map each specific set with a common callback.

be able to use this specific env like a global env.

## sample

- lua5.2.loader() <- specific
 -- fallback to luacommon.* <- all other functions (also contains specific luacommon.loader, but not reachable)


## be able to target multiple API inside the code

* be able to choose to request more than one API

sample:
local searchpath = require("lua-compat.5.3").searchpath
local utf8 = require("lua-compat.modules").utf8
local lua51 = require("lua-compat.5.1")

--> run the code in lua 5.1 but with utf8 and searchpath support.
local env = newenv({utf8 = utf8, searchpath=searchpath}, lua51) -- new env with utf8 and searchpath and parent env is Lua5.1


# 2nd Goal : sandboxes

Be able to setup complex sandbox.
We need to fake/implement controlled version of the standard API (like `require()`) inside the sandbox.




lua/
	init.lua
	5/
		init.lua
		0/
			init.lua
		1/
			init.lua
		2/
			init.lua
		3/
			_G.lua

require("lua.5.3").utf8
require("lua.5.1")._G

require("lua") <- bind to local natif API

local lua53 = require("lua.5.3")
local utf8 = lua53:require("utf8")

a common require implementation should be able to detect (with the self) what API should be used.



# License

 * MIT
