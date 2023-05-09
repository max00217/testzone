local http = require("http")
local fs = require("fs")

http.createServer(function (request, response)
    -- index.html 파일 읽기
    local filename = "C:/Users/makpu/Downloads/proj/project/Lua/Luvit_web/public/index.html" -- index.html 파일의 경로
    local fileStream = fs.createReadStream(filename)

    -- 클라이언트로 index.html 파일 읽어서 보내기
    fileStream:on("open", function ()
       response:setHeader("Content-Type", "text/html")
       fileStream:pipe(response)
    end)

    -- 에러 처리
    fileStream:on("error", function (err)
       response:setHeader("Content-Type", "text/plain")
       response.statusCode = 404 -- <- 수정된 부분입니다
       response:write("404 Not Found\n")
       response:write("The requested URL " .. filename .. " was not found on this server.\n")
       response:finish()
   end)
end):listen(8080, function ()
    print("Server listening at http://localhost:8080/")
end)