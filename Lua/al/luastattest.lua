package.path = package.path..";C:/Users/makpu/Downloads/proj/project/Lua/modules/luastats/?.lua"
package.path = package.path..";C:/Users/makpu/Downloads/proj/project/Lua/modules/luaplot/?.lua"
local stats = require("stats")
local plot = require("plot")

-- Define the example data
local x = {1, 2, 3, 4, 5}
local y = {2, 4, 5, 4, 6}

-- Calculate the linear regression coefficients using LuaStats
local slope, intercept, r, stderr = stats.linregress(x, y)

-- Print the results
print("Slope:", slope)
print("Intercept:", intercept)
print("R:", r)
print("Standard error:", stderr)

-- Create a scatter plot of the data using LuaPlot
plot.scatter(x, y)

-- Add the linear regression line to the plot
local x_min, x_max = plot.xlim()
local y_min, y_max = plot.ylim()
local line_x = {x_min, x_max}
local line_y = {intercept + slope*x_min, intercept + slope*x_max}
plot.plot(line_x, line_y, {color = "red"})

-- Show the plot
plot.show()