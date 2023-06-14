def is_munchausen_number(num):
    digits = [int(digit) for digit in str(num)]
    powered_sum = sum([digit ** digit for digit in digits])
    return powered_sum == num

for num in range(1, 200001):
    if is_munchausen_number(num):
        print(num)