local socket = require("socket")

-- Create a TCP socket
local tcp = socket.tcp()

-- Connect to a remote server
local host = "www.example.com"
local port = 80
local timeout = 10

tcp:settimeout(timeout)
local success, err = tcp:connect(host, port)

if not success then
  print("Failed to connect:", err)
  return
end

print("Connected to", host, "on port", port)

-- Send an HTTP request
local request = "GET / HTTP/1.1\r\nHost: " .. host .. "\r\nConnection: close\r\n\r\n"
success, err = tcp:send(request)

if not success then
  print("Failed to send request:", err)
  tcp:close()
  return
end

-- Receive the response
local response, err, partial = tcp:receive("*a")

if not response and partial then
  response = partial
end

if not response then
  print("Failed to receive response:", err)
  tcp:close()
  return
end

print("Received response:")
print(response)

-- Close the connection
tcp:close()