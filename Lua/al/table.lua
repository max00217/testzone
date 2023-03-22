tablearray1 = {1, 2, 3}

tablearray2 = {"Lua", "Python", "Kotlin"}

tablelist = {1, "A", 2 ,"B", 3, "C", {"I", "am", "Table", "In", "The", "Table"}}

tabledict = {["Hello"] = "World", ["Myname"] = "Lua", ["Slow"] = "Python"}

for i=1, #tablearray1 do
    print(tablearray1[i]) --Array
end
print("\n")
for i=1, #tablearray2 do
    print(tablearray2[i]) --Array
end
print("\n")
for i=1, #tablelist do
    print(tablelist[i]) --List
end
print("\n")
for i=1, #tablelist[7] do
    print(tablelist[7][i]) --List Table in the Table
end
print("\n")
for key, value in pairs(tabledict) do
    print(key, value) --Dictionary
end