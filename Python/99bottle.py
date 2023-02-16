for i in range(99, 0, -1):
    if i == 1:
        print("1 bottle of beer on the wall, 1 bottle of beer!")
        print("Take one down, pass it around, no more bottles of beer on the wall!")
    else:
        print(f"{i} bottles of beer on the wall, {i} bottles of beer!")
        print(f"Take one down, pass it around, {i-1} {'bottle' if i-1 == 1 else 'bottles'} of beer on the wall!\n")
