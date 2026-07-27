# This Python code tests Goldbach's Conjecture by finding two prime numbers that add up to any given even number. 
# It uses a simple prime check function and a loop to find the matching pair.


import math

# Check if a number is prime
def is_prime(n: int) -> bool:
    if n <= 1:
        return False
    # Check dividers up to the square root of n
    for i in range(2, int(math.isqrt(n)) + 1):
        if n % i == 0:
            return False
    return True

# Find two primes that add up to an even number n
def find_goldbach_pair(n: int) -> tuple:
    if n <= 2 or n % 2 != 0:
        raise ValueError("Number must be an even number greater than 2")
    
    # Loop from 2 up to half of n (inclusive)
    for i in range(2, (n // 2) + 1):
        if is_prime(i) and is_prime(n - i):
            return (i, n - i)
            
    raise RuntimeError("No pair found (Conjecture would be false!)")

# Test an example number
num = 28
p1, p2 = find_goldbach_pair(num)
print(f"The number {num} = {p1} + {p2}")
