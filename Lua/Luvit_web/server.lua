local http = require('http')
local fs = require('fs')

local script_path = debug.getinfo(1).source:sub(2):match("(.*[/\\])")

local function processHtml(file_path, req, res)
  fs.readFile(file_path, function (err, data)
    if err then
      res:setHeader('Content-Type', 'text/plain')
      res:setHeader('Status', '500 Internal Server Error')
      res:finish('Error: ' .. err .. '\n')
    else
      res:setHeader('Content-Type', 'text/html')
      res:setHeader('Status', '200 OK')
      res:finish(data)
    end
  end)
end

local server = http.createServer(function (req, res)
  if req.url == '/' then
    processHtml(script_path .. "index.html", req, res)
  elseif req.url == '/second.html' then
    processHtml(script_path .. "second.html", req, res)
  else
    res:setHeader('Content-Type', 'text/plain')
    res:setHeader('Status', '404 Not Found')
    res:finish('Error: Page not found\n')
  end
end)

server:listen(8080, function ()
  print("Server listening at http://localhost:8080/")
end)
