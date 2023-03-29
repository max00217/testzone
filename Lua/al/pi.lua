local res = 4
for i = 1, 10000000 do
    res = res + ((-1)^i)*(4/(2*i+1))
    print(res)
end