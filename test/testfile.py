def fib_calc(n):
    print('hello from Python')
    fib1 = fib2 = 1
    print(f'Fibonacci sequence for {n=}:')
    print(fib1, fib2, end=' ')
    
    for i in range(2, n):
        fib1, fib2 = fib2, fib1 + fib2
        print(fib2, end=' ')