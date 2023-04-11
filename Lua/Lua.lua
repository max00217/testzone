io.write("Enter a number: ")
local num = tonumber(io.read())

local i = 1

while i <= num do
    if num % i == 0 then
        print(i)
    end
    i = i + 1
end