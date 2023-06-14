function isMunchausenNumber(num)
    local digits = {}
    for digit in string.gmatch(tostring(num), "%d") do
        table.insert(digits, tonumber(digit))
    end

    local poweredSum = 0
    for _, digit in ipairs(digits) do
        poweredSum = poweredSum + math.pow(digit, digit)
    end

    return poweredSum == num
end

for num = 1, 200000 do
    if isMunchausenNumber(num) then
        print(num)
    end
end