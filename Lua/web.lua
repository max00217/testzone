package.path = package.path..";C:\\Users\\makpu\\Downloads\\proj\\project\\Lua\\modules\\sailor\\src\\?.lua"

local sailor = require "sailor"

-- Define the route for the homepage
sailor.route:match("/", function()
    return "Hello, world!"
end)

-- Start the server
sailor.start()