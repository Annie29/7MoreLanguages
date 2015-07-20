--[[  
    The Hard  Problem from Day 1 of 
    Seven More Languages in Seven Weeks:
	
	Write a function reduce(max, init, f) that calls a function f() over the integers
	from 1 to max like so:

	function add(previous, next)
		return previous + next
	end
	reduce(5, 0, add) -- add the numbers from 1 to 5
	
	Implement factorial() in terms of reduce().
	]]
	
function reduce (max, init, f)
   local result = init
   local current = 1
   while current <= max do
      result = f(result, current)
	  current = current + 1
   end
   return result
end

--  Check the basic reduce
function add (prev, next)
   return prev + next
end

print(reduce(5, 0, add))

--  Now, the factorial
function multiply(x, y)
   return x * y
end

--  Not too rough once reduce is done!
function factorial(max)
   return reduce(max, 1, multiply)
end