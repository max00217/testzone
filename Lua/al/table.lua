tablearray1 = {1, 2, 3}

tablearray2 = {"Lua", "Python", "Kotlin"}

tablelist = {1, "A", 2, "B", 3, "C", {"I", "am", "Table", "In", "The", "Table"}}

tabledict = {["Hello"] = "World", ["Myname"] = "Lua", ["Slow"] = "Python"}


print(table.concat(tablearray1, ", ")) --Array

print(table.concat(tablearray2, ", ")) --Array

print("\n")
for i=1, #tablelist do
    if i == #tablelist then
        print(table.concat(tablelist[7], ", "))
    else
        print(tablelist[i])
    end
end    --List

print("\n")
for i=1, #tablelist[7] do
    print(tablelist[7][i]) --List Table in the Table
end

print("\n")
for key, value in pairs(tabledict) do
    print(key, value) --Dictionary
end