cnt = 0

for i = 1, 1000000 do
    q = math.random(1, 10)
    print(q)
    if q == 5 then
        cnt = cnt + 1
    end
end
print("cnt: "..cnt)