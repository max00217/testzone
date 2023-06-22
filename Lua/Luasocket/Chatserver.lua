local socket = require("socket")

-- Create TCP server
local server, server_err = socket.bind("localhost", 12345)
if server_err then
    print("Error creating server:", server_err)
    return
end

local clients = {}

-- Set server to non-blocking mode
server:settimeout(0)

print("Server started on port 12345")

while true do
    local client = server:accept()

    if client then
        client:settimeout(0)
        local client_ip, client_port = client:getsockname()
        print("New client connected:", client_ip, client_port)
        table.insert(clients, client)
    end

    for i, client in ipairs(clients) do
        local message, rec_err = client:receive('*l')

        if not message then
            if rec_err == "closed" then
                print("Client disconnected")
                table.remove(clients, i)

                -- Inform other clients that a client has disconnected
                for _, other_client in ipairs(clients) do
                    other_client:send("Client disconnected\n")
                end
            end
        else
            print("Message received:", message)

            -- Inform other clients of the received message
            for _, other_client in ipairs(clients) do
                other_client:send(message .. "\n")
            end
        end
    end

    socket.sleep(0.01)
end
