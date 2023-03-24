function table.indexOf(t, value)
    for i, v in ipairs(t) do
        if v == value then
            return i
        end
    end
    return nil
end
for i = 1, 3 do
    io.write("R, P, or S: ")
    user = io.read()

    rps_table = {"R", "P", "S"}

    bot = rps_table[math.random(#rps_table)]

    result = table.indexOf(rps_table, user) - table.indexOf(rps_table, bot)

    if result == 0 then
        print(string.format('%s vs %s  Draw', user, bot))
    elseif result == 1 or result == -2 then
        print(string.format('%s vs %s  You Wins', user, bot))
    else
        print(string.format('%s vs %s  You Lose', user, bot))
    end
end