-- Wavelet Transform function
local function WaveletTransform(image)
    local width = #image[1]
    local height = #image
  
    local function SplitSignal(signal)
      local length = #signal
      local half = math.floor(length / 2)
      local lowpass = {}
      local highpass = {}
  
      for i = 1, half do
        local sum = signal[i] + signal[i + half]
        local diff = signal[i] - signal[i + half]
        lowpass[i] = sum / 2
        highpass[i] = diff / 2
      end
  
      return lowpass, highpass
    end
  
    local function TransformRow(row)
      local lowpass, highpass = SplitSignal(row)
  
      for i = 1, #lowpass do
        row[i] = lowpass[i]
        row[i + #lowpass] = highpass[i]
      end
    end
  
    local function TransformColumn(column)
      local lowpass, highpass = SplitSignal(column)
  
      for i = 1, #lowpass do
        column[i] = lowpass[i]
        column[i + #lowpass] = highpass[i]
      end
    end
  
    -- Transform rows
    for y = 1, height do
      TransformRow(image[y])
    end
  
    -- Transpose the image
    local transposed = {}
    for x = 1, width do
      transposed[x] = {}
      for y = 1, height do
        transposed[x][y] = image[y][x]
      end
    end
  
    -- Transform columns
    for x = 1, width do
      TransformColumn(transposed[x])
    end
  
    -- Transpose back the image
    for x = 1, width do
      for y = 1, height do
        image[y][x] = transposed[x][y]
      end
    end
  end
  
  -- Test image data (2D table)
  local image = {
    {50, 30, 40, 70},
    {60, 20, 80, 90},
    {70, 10, 50, 60},
    {80, 30, 40, 20}
  }
  
  -- Apply Wavelet Transform
  WaveletTransform(image)
  print("Wavelet Compression:")
  for y = 1, #image do
      local row = {}
      for x = 1, #image[1] do
          table.insert(row, string.format("%.2f", image[y][x]))
      end
      print(table.concat(row, "\t"))
  end
  
  
  