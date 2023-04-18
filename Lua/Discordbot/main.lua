package.path = package.path .. ";C:\\Users\\makpu\\Downloads\\Projects\\Lua\\Discordbot\\deps\\discordia"
local discordia = require("discordia")
local json = require("json")
local client = discordia.Client()
local prefix = "&"

client:on("ready", function()
    client:setGame("Develope with Lua")
end)

local file = io.open("./token.txt")
local token = file:read("*a")
file:close()

client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)


client:run("Bot "..token)