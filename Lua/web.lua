package.path = package.path..";C:\\Users\\makpu\\Downloads\\proj\\project\\Lua\\modules\\lapis\\lapis\\?.lua"

local lapis = require("lapis")

local app = lapis.Application()

app:get("/", function()
  return "<html><body><h1>I am Lapis</h1></body></html>"
end)

app:run()