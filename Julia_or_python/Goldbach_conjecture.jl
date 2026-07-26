# This Julia code tests Goldbach's Conjecture by finding two prime numbers that add up to any given even number. 
# It uses a simple prime check function and a loop to find the matching pair


# Check if a number is prime
function is_prime(n::Int)
    if n <= 1
        return false
    end
    for i in 2:isqrt(n)
        if n % i == 0
            return false
        end
    end
    return true
end

# Find two primes that add up to an even number n
function find_goldbach_pair(n::Int)
    if n <= 2 || n % 2 != 0
        error("Number must be an even number greater than 2")
    end
    
    for i in 2:(n ÷ 2)
        if is_prime(i) && is_prime(n - i)
            return (i, n - i)
        end
    end
    error("No pair found (Conjecture would be false!)")
end

# Test an example number
num = 28
p1, p2 = find_goldbach_pair(num)
println("The number $num = $p1 + $p2")
