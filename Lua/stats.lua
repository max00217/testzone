package.path = package.path .. "\\luastats\\?.lua"
local stats = require("stats")

data = {3, 4, 5, 7, 10}

-- mean1 = stats.mean(1,3,4)

-- variance = stats.var(data)

-- std_dev = stats.sd(data)

print("Mean: "..mean(data))
print("Variance: "..var(data))
print("Standard Deviation: "..sd(data))