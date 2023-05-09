local http = require('http')
local fs = require('fs')

local script_path = debug.getinfo(1).source:sub(2):match("(.*[/\\])")
local index_file_path = script_path .. "index.html"

-- Create a server object
local server = http.createServer(function (req, res)
  if req.url == '/' then
    -- Read the contents of index.html file
    fs.readFile(index_file_path, function (err, data)
      if err then
        -- Handle error if the file can't be read
        res:setHeader('Content-Type', 'text/plain')
        res:setHeader('Status', '500 Internal Server Error')
        res:finish('Error: ' .. err .. '\n')
      else
        -- Send the contents of the file as the response body
        res:setHeader('Content-Type', 'text/html')
        res:setHeader('Status', '200 OK')
        res:finish(data)
      end
    end)
  else
    -- Handle all other routes
    res:setHeader('Content-Type', 'text/plain')
    res:setHeader('Status', '404 Not Found')
    res:finish('Error: Page not found\n')
  end
end)

-- Start the server and listen for incoming connections on port 8080
server:listen(8080, function ()
  print("Server listening at http://localhost:8080/")
end)
