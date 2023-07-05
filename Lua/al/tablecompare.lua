local mytable = { 7, 4, 1, -2, 3, 1, 5, 2, 6, 8, -1 }
local extables = {
    { 2, 5, 3, 1, 6, 4, 3, 2, 4, 6, 2 },
    { 7, 1, 5, 3, 2, 1, 4, 2, 3, 6, -1 },
    { 3, 2, 4, 1, 5, 3, 2, 4, 6, 2, 1 },
    { 5, 1, 3, 2, 4, 6, 2, 1, 4, 3, 5 },
    { 6, 4, 3, 2, 5, 1, 4, 2, 3, 6, 2 }
}

local function tablecompare(table1, table2)
    local score = 0
    for i = 1, #table1 do
        score = score + table1[i] * table2[i]
    end
    return score
end

local function bestmatch(mytable, extables)
    local BMindex = 1
    local BMscore = tablecompare(mytable, extables[1])

    for i = 2, #extables do
        local score = tablecompare(mytable, extables[i])
        if score > BMscore then
            BMindex = i
            BMscore = score
        end
    end

    return extables[BMindex], BMscore
end

local bestTable, bestScore = bestmatch(mytable, extables)
print("most similar table: ", table.concat(bestTable, ", "))
print("score: ", bestScore)
