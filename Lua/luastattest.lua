
package.path = package.path..";/Users/makpu/Downloads/proj/project/Lua/modules/luastats/?.lua"
stats = require("stats")

--[[data = {3, 4, 5, 7, 10}

mean1 = mean(1,3,4)

variance = var(data)

std_dev = sd(data)

print("Mean:"..mean(data))
print("Variance:"..var(data))
print("Standard Deviation:"..sd(data))]]

-- Load data
local data = {10, 15, 16, 20, 22, 25, 28, 32, 35, 40}
local n = #data

-- Calculate the sum of the data points
local sum_x = 0
local sum_y = 0
for i = 1, n do
  sum_x = sum_x + i
  sum_y = sum_y + data[i]
end

-- Calculate the means
local mean_x = sum_x / n
local mean_y = sum_y / n

-- Calculate the variances
local var_x = 0
local var_y = 0
for i = 1, n do
  var_x = var_x + (i - mean_x)^2
  var_y = var_y + (data[i] - mean_y)^2
end
var_x = var_x / (n - 1)
var_y = var_y / (n - 1)

-- Calculate the covariance
local cov_xy = 0
for i = 1, n do
  cov_xy = cov_xy + (i - mean_x) * (data[i] - mean_y)
end
cov_xy = cov_xy / (n - 1)

-- Calculate the slope and y-intercept
local slope = cov_xy / var_x
local y_intercept = mean_y - slope * mean_x

-- Print the results
print("Slope: " .. slope)
print("Y-intercept: " .. y_intercept)

-- Plot the data and linear regression line
local gnuplot = require("gnuplot")
gnuplot.plot(data, "+", {x=1,y=y_intercept}, {x=n,y=slope*n+y_intercept})

