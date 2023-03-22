function table.indexOf(t, value)
    for i, v in ipairs(t) do
        if v == value then
            return i
        end
    end
    return nil
end

function table.removeByValue(t, value)
    local index = table.indexOf(t, value)
    if index then
        table.remove(t, index)
    end
end

local class = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 35}

while true do
    io.write("Press Enter...")
    user = io. read()
    if user == "" then
        n1 = class[math.random(#class)]
        table.removeByValue(class, n1)
        n2 = class[math.random(#class)]
        table.removeByValue(class, n2)
    end
    print("\n",n1, n2,"\n")
    if n1 == nil or n2 == nil then
        break
    end
end
