un = int(input("Enter the Number: "))
sq = 1
for i in range(1, 101):
    print(i, ": ", un*sq)
    sq = sq*un
