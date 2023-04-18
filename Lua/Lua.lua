package.path = package.path .. ";C:\\Users\\makpu\\Downloads\\proj\\project\\Lua\\modules\\bigint.lua\\?.lua"
local bigint = require("bigint")


function demo_exponentiate(n1, n2)
    print(tostring(n1), tostring(n2), tostring(bigint.unserialize(bigint.exponentiate(bigint.new(n1), bigint.new(n2)), "string")))
end

demo_exponentiate(2, 100000)