local http = require('http')
local fs = require('fs')

local script_path = debug.getinfo(1).source:sub(2):match("(.*[/\\])") --상대 경로 확인하는 코드

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
        processHtml(script_path .. "index.html", req, res)--script.path.."파일명"으로 경로 지정
    elseif req.url == '/second.html' then
        processHtml(script_path .. "second.html", req, res)--script.path.."파일명"으로 경로 지정
    else
        res:setHeader('Content-Type', 'text/plain')
        res:setHeader('Status', '404 Not Found')
        res:finish('Error: Page not found\n')
    end
end)

server:listen(8080, "0.0.0.0", function ()
    print("Server listening at http://0.0.0.0:8080/\nServer listening at http://localhost:8080/")
    --At desktop, use this link http://121.153.4.209:8080/
end)
