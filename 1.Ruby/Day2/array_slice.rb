#Initialize an empty array
array_to_print = []

#Fill the array with 16 random numbers
16.times do
  array_to_print << rand(100)
end

#This is the array to print
puts "Array to print: " + array_to_print.join(", ").to_s

#Logic to print the array in slices of 4
counter = 0
array_to_print.each_slice(4) do |array_slice|
  counter = counter + 1
  puts "Slice #{counter}"
  puts array_slice.join(", ")
end