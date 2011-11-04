#1 Print the string "Hello, world."
puts "### 1 ###"
puts "Hello, world."
#2 For the string “Hello, Ruby,” find the index of the word “Ruby.”
puts "### 2 ###"
str = "Hello Ruby"
puts str
index = str.index "Ruby"
puts "Index of Ruby in that string is " + index.to_s
#3 Print your name ten times.
puts "### 3 ###"
puts "Kumaran" * 10
#4 Print the string "This is sentence number 1" where the number 1 changes from 1 to 10.
puts "### 4 ###"
(1..10).each do |x| puts "This is sentence #{x}" end
#5 Run a Ruby program from a file. See linked file helloworld.rb

# Bonus Problem. See linked file bonusproblem.rb
