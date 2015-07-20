--[[  
    The Medium Problem from Day 1 of 
    Seven More Languages in Seven Weeks:
	
	What if Lua didn’t have a for loop? Using if and while, write a function
    for_loop(a, b, f) that calls f() on each integer from a to b (inclusive).
	]]
	
function for_loop(a, b, f)
--Okey dokey.  Why do I need the if?
    local value = a
	while value <= b do
	   f(value)
	   value = value + 1
	end
end

--Hmmm, can I just pass print to this?  Yes!
for_loop(1, 5, print)

-- And I can write my own function too
function update(val)
   sum = sum + val  --  This figures out the correct global variable!
end

sum = 0
for_loop(2, 9, update)
print ("Final sum is "..sum)

