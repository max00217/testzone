startTime = os.time()
endTime = startTime + 5  -- run for 5 seconds

for i = 1, 20000 do
  if os.time() >= endTime then
    break  -- exit the loop if 5 seconds have passed
  end
  print(i*i)
end