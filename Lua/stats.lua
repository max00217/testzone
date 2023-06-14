package.path = package.path .. "\\luastats\\?.lua"
local stats = require("stats")

data = {0.304, 7.644, 0.248, 0.575, 0.473, 0.421}

print("Mean: "..mean(data))
print("Variance: "..var(data))
print("Standard Deviation: "..sd(data))