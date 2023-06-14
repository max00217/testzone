Table = {1, 2, 3, 4, 5, 6}

for i = 1, 5 do
    local q = math.random(i, #Table)
    local w = Table[q]
    print(w)
    table.remove(Table, w)
end