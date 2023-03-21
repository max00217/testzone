package.path = package.path..";C:\\Users\\makpu\\Downloads\\proj\\project\\Lua\\modules\\socket\\?.lua"
package.cpath = package.cpath..";C:\\Users\\makpu\\Downloads\\proj\\project\\Lua\\modules\\socket\\?.dll"

local socket = require("socket")

-- Create a TCP/IP client socket
local client = socket.tcp()

-- Connect to the server (in this case, the website)
client:connect("example.com", 80)

-- Send an HTTP request to the server
local request = "GET / HTTP/1.1\r\nHost: example.com\r\nConnection: close\r\n\r\n"
client:send(request)

-- Read the server's response
local response = ""
while true do
  local data, err, partial = client:receive("*a")
  if not data then
    response = response .. partial
    break
  else
    response = response .. data
  end
end

-- Print the server's response, which includes the webpage content
print(response)
print("asjdfkslkdfj")