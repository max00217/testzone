package.path = package.path..";C:\\Users\\makpu\\Downloads\\proj\\project\\Lua\\modules\\luasocket\\src\\?.lua"

local socket = require("socket")

-- Connect to the server
local client = socket.connect("localhost", 8080)

-- Send a message to the server
client:send("Hello, server!\n")

-- Receive a response from the server
local response, err = client:receive()
if err then
  print("Error: " .. err)
else
  print(response)
end

-- Close the connection
client:close()