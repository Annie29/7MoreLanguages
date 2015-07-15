--[[
    Solutions to the easy portion of Day 1 Lua problems 
  ]]
  
function ends_in_3(num)
--  Well, dang it, I do have to worry about % and negative numbers.  Since -7 % 10 = 3, 
--  use the absolute value
   return math.abs(num) % 10 == 3
end

function is_prime (num)
-- Since this is a language exercise, not an algorithm exercise, use brute force...
    for i = 2, math.sqrt(num) do
		if num % i == 0 then 
	      return false
		end
	end
	return true
end

--[[ Hmm, this is the major problem asked for.
   We could get fancy and create a function that combines the two functions 
   before this, but I don't think that's the point...at least until we get to 
   tables.
   ]]
function find_primes(n)
	local found_so_far = 0
	local current = 2
	--  Again, more brute force...
	while found_so_far < n do
		if ends_in_3(current) and is_prime(current) then
			found_so_far = found_so_far + 1
			print (current)
		end
		current = current + 1
	end
end

function solve_easy()
	print("How many primes less than 3:")
	local n = io.input():read ("*number")       -- read a number
	print(find_primes(n))
end
