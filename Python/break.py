import time

start_time = time.time()
end_time = start_time + 5  # run for 5 seconds

i = 0
while time.time() < end_time:
    print(i*i*i*i*i)
    i += 1