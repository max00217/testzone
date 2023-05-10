-- set the dimensions of the image to generate
local width, height = 1000, 1000

-- set the minimum and maximum values for the real and imaginary parts of c
local min_real, max_real = -2, 2
local min_imag, max_imag = -2, 2

-- set the maximum number of iterations for the Mandelbrot calculation
local max_iterations = 100

-- create a 2D array to store the results of the Mandelbrot calculation
local mandelbrot = {}
for i = 1, height do
    mandelbrot[i] = {}
end

-- calculate the Mandelbrot set
for y = 1, height do
    for x = 1, width do
        -- map pixel coordinates to complex plane coordinates
        local c_real = min_real + (max_real - min_real) * (x - 1) / (width - 1)
        local c_imag = max_imag - (max_imag - min_imag) * (y - 1) / (height - 1)
        
        -- initialize z to 0
        local z_real, z_imag = 0, 0
        
        -- calculate z for up to max_iterations
        local iteration = 1
        while z_real * z_real + z_imag * z_imag <= 4 and iteration < max_iterations do
            local new_real = z_real * z_real - z_imag * z_imag + c_real
            local new_imag = 2 * z_real * z_imag + c_imag
            z_real, z_imag = new_real, new_imag
            iteration = iteration + 1
        end
        
        -- store the iteration count in the mandelbrot array
        mandelbrot[y][x] = iteration
    end
end

-- generate the Mandelbrot set image as a string of characters
local image = ""
for y = 1, height do
    for x = 1, width do
        local color = (mandelbrot[y][x] == max_iterations) and " " or "@"
        image = image .. color
    end
    image = image .. "\n"
end

-- output the image to the console
print(image)
