math.randomseed(os.time())

function table.contains(table, val)
    for i = 1, #table do
        if table[i] == val then
            return true
        end
    end
    return false
end

local winnum = {}
for i = 1, 6 do
    local number = math.random(1, 45)
    while table.contains(winnum, number) do
        number = math.random(1, 45)
    end
    table.insert(winnum, number)
end

table.sort(winnum)

print("Enter your numbers:")
local usernum = {}
for i = 1, 6 do
    local number = io.read("*n")
    while number == nil or number < 1 or number > 45 or table.contains(usernum, number) do
        print("Invalid input, please enter a number between 1 and 45 that hasn't been entered before.")
        number = io.read("*n")
    end
    table.insert(usernum, number)
end

table.sort(usernum)

local match = 0
for i, num in ipairs(usernum) do
    if table.contains(winnum, num) then
        match = match + 1
    end
end

print("Winning numbers: " .. table.concat(winnum, ", "))
print("Your numbers: " .. table.concat(usernum, ", "))
print("Number of matches: " .. match)
if match == 6 then
    print("Congratulations! You won the jackpot!")
elseif match == 5 then
    print("You won the second prize!")
elseif match == 4 then
    print("You won the third prize!")
elseif match == 3 then
    print("You won the fourth prize!")
else
    print("Sorry, you didn't win anything.")
end
