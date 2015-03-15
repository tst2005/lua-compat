
local lua = require("lua") -- get the native API (like _G but with more functions ...
-- supposed to be lua5.2
local lua53 = require("lua-5.3")

-- debug is not more in global env by default, need require()
local debug = lua53:require("debug") -- success

-- backward compat
local setfenv = require("lua5.1"):require("_G").setfenv

-- forward compat
local utf8 = require("lua5.3"):require("utf8")



-- easier way to get a module
local pack = require("lua5.3")("table").pack
local pack = require("lua5.3").table.pack -- the .table key is catch with __index to call require("table")

-- low level access
local specifics = require("lua5.3"):specifics() -- expose the compat functions ?
local common = require("lua5.3"):parent() -- return the parent env (the common one)
local common2 = require("lua5") -- common == common2 ?



