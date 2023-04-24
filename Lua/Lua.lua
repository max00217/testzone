s = {
    "  *  ",
    " * * ",
    "*****"
}

m = {}

for i = 1, 3500 do
    m[i] = {}
    for j = 1, 6500 do
        m[i][j] = " "
    end
end

function solve(n, y, x)
    if n == 1 then
        for i = 1, 3 do
            for j = 1, 5 do
                m[y+i-1][x+j-1] = s[i]:sub(j,j)
            end
        end
        return
    end
    solve(math.floor(n/2), y, x+3*(math.floor(n/2)))
    solve(math.floor(n/2), y+3*(math.floor(n/2)), x)
    solve(math.floor(n/2), y+3*(math.floor(n/2)), x+3*n)
end

n = io.read("*n")
solve(math.floor(n/3), 1, 1)

for i = 1, n do
    for j = 1, 2*n-1 do
        io.write(m[i][j] == "*" and "*" or " ")
    end
    io.write("\n")
end