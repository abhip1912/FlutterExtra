counter = 1
for i in range(5):
    for j in range(5):
        print(counter, end="")
        if counter == 1:
            counter = 0
        else:
            counter = 1
    print()
    if i%2==0:
        counter = 0
    else: 
        counter = 1