#Initialize an empty array
array_to_print = []

#Fill the array with 16 random numbers
16.times do
  array_to_print << rand(100)
end

#This is the array to print
puts "Array to print: " + array_to_print.join(", ").to_s

#Logic to print the array in slices of 4
array_stack = []
counter = 0;
array_to_print.each do |element|
  array_stack << element
  counter = counter + 1
  if counter % 4 == 0 then
    puts "Slice #{counter}"
    puts array_stack.join(", ")
    array_stack = []
    counter = 0
  end 
end