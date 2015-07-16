--[[
  Explorations in tail recursion optimization
]]

--  Return the sum of 1 to max, recursively, badly
--  That is, using recursion, not tail recursion
--  This code chokes somewhere between 10,000 and 100,000
--  More precisely, the last one it can compute is 19,997, 
--  at least on my computer.
function sum_badly(max)
	if max <= 1 then 
		return max
	end
	local other_sum = sum_badly(max - 1)
	return other_sum + max
end

--[[  Return the sum of 1 to max, recursively, 
  almost as badly.  It looks a little more like tail recursion, 
  but there's still an addition step that needs to be done after
  the recursive call
  ]]
--  This code chokes somewhere between 10,000 and 100,000 too
function sum_just_as_badly(max)
	if max <= 1 then 
		return max
	end
	return max + sum_just_as_badly(max - 1)
end

--[[  Oh no Mr. Bill, that code can't be tail recursive!
   
   Actually, using a "trick" that was beat into me from 
   Seven Languages in Seven Weeks, you can come up with a
   tail recursive version.  Really!  Take a look below:
   ]]
function sum_well_helper(max, current)
	if max < 1 then
	   return current
	else
		return sum_well_helper(max -1, current + max)
	end
end

function sum_well(max)
   return sum_well_helper(max, 0)
end

--[[
   A simple example from the blog entry
   ]]
   
 -- The classic recursive solution
 function fact_1(num)
    if num <= 1 then 
	   return 1
	else
	   return num * fact_1 (num - 1)
	end
 end
 
 -- The two parameter recursive solution
 function fact_2 (num, result)
    if num <= 1 then 
	   return result
	else
	   return fact_2 (num - 1, result * num)
	end
 end
 
 --  The one parameter call to the tail recursive function
 function factorial (num)
    return fact_2(num, 1)
 end
 