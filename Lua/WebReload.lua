local http = require("socket.http")
local ltn12 = require("ltn12")

local function table_to_string(tbl)
    local result = ""
    for k, v in pairs(tbl) do
        result = result .. k .. "=" .. v .. "; "
    end
    return result
end

local username = "max00217"
local api_token = "a78785211daf50069f3ff1991d862de30bc4b9a5"
local domain_name = "max00217.pythonanywhere.com"
local url = "https://www.pythonanywhere.com/api/v0/user/" .. username .. "/webapps/" .. domain_name .. "/reload/"

local request_body = ""
local response_body = {}
local response_code, response_headers, response_status = http.request{
    method = "POST",
    url = url,
    headers = {
        ["Authorization"] = "Token " .. api_token,
        ["Content-Type"] = "application/x-www-form-urlencoded",
        ["Content-Length"] = #request_body,
    },
    source = ltn12.source.string(request_body),
    sink = ltn12.sink.table(response_body)
}

if response_code == 200 then
    print("reloaded OK")
else
    print("Got unexpected status code " .. response_code .. ": " .. table.concat(response_body))
end
