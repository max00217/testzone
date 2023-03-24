io.write("Enter the Number: ")
un = tonumber(io.read())
sq = 1
for i = 1,100 do
    print(i..": "..un*sq)
    sq = sq*un
end