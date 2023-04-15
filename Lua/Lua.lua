Person = {
  name = "John",
  age = 30
}

meta = {
  __call = function(table, ...)
    print("Calling Person with arguments:", ...)
  end
}

setmetatable(Person, meta)

Person("arg1", "arg2") -- "Calling Person with arguments: arg1 arg2"
