MAX = 10000
class Assess
	def initialRun
		arr = [10, 30, 40, 50, 1000]
		n = (arr.size/arr[0])
		callPrime(arr, n)
	end

	def callPrime(arr, n)
		primes = []
		markedPushPrime(primes);
		sum_of_primes = []
		sum_of_primes[primes.size + 1] = 0;
 
		for i in 1...(primes.size)
			sum_of_primes[i] = primes[i-1] + sum_of_primes[i-1]
		end

		for i in 0...n
			p insertConsecPrime(arr[i], primes, sum_of_primes) 
		end
	end

	def markedPushPrime(primes)
		marked = []
		marked[MAX/2 + 1] = false

		for i in 1..(((MAX*MAX)-1)/2)
			k=(i*(i+1))<<1
			for j in k...(MAX/2)
				j=j+2*i+1
				marked[j] = true
			end
		end

    	primes.push(2);

    	for i in 1..(MAX/2)
    		if marked[i].eql?(false)
    			primes.push(2*i+1)
    		end
    	end 
	end

	def insertConsecPrime(limit, prime, sum_of_primes)

    	max_length = -1; 
    	prime_number = -1;
	
		for i in 0..(prime[i]<=limit)
			for j in 0...(j<i)
				break if(sum_of_primes[i] - sum_of_primes[j] > limit)
				consSum = sum_of_primes[i] - sum_of_primes[j]

				if binary_search(prime[0], prime[prime.length-1])
					if (max_length < i-j+1)
						max_length = i-j+1
						prime_number = consSum
					end
				end
			end
		end 
		prime_number
	end
end


Assess.new.initialRun