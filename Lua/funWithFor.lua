for i = 1, 5 do
   print("Before increment, i = " ..i)
   i = i + 1
   print("After increment, i = " ..i)
end   

--print ("After loop, i = " .. i)  -- This fails, since i is set to nil