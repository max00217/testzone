local startTime = os.time()
local endTime = startTime + 0.5  -- run for 5 seconds

for i = 1, 60 do
  if os.time() >= endTime then
    break  -- exit the loop if 5 seconds have passed
  end
  print("asrfasdf")
end