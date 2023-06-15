-- function average(arr)
--     local sum = 0
--     for i = 1, #arr do
--         sum = sum + arr[i]
--     end
--     return sum / #arr
-- end

-- function correlation_coefficient(x, y)
--     local x_mean = average(x)
--     local y_mean = average(y)
--     local num, denom_x, denom_y = 0, 0, 0
--     for i = 1, #x do
--         num = num + (x[i] - x_mean) * (y[i] - y_mean)
--         denom_x = denom_x + (x[i] - x_mean) ^ 2
--         denom_y = denom_y + (y[i] - y_mean) ^ 2
--     end
--     return num / math.sqrt(denom_x * denom_y)
-- end

-- local execution_time = {0.304, 7.644, 0.248, 0.575, 0.473, 0.421}
-- local code_lines = {11, 15, 19, 8, 9, 13}

-- local corr_coeff = correlation_coefficient(execution_time, code_lines)
-- print("Correlation Coefficient: ", corr_coeff)
