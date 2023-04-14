local myTable = {}

local mt = {
  __index = function(table, key)
    if key == "greeting" then
      return "Hello!"
    elseif key == "name" then
      return "John"
    else
      return nil
    end
  end,

  __newindex = function(table, key, value)
    if key == "age" then
      print("Setting age to:", value)
      rawset(table, key, value)
    else
      print("Invalid key:", key)
    end
  end
}

setmetatable(myTable, mt)

print(myTable.greeting)
print(myTable.name)
print(myTable.age)


myTable.age = 30
myTable.gender = "Male"
