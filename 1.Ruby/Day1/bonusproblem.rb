number_in_hand = rand(100)
found = false
while !found
puts "Enter your Guess (1-100): "
number_guessed = gets.to_i
found = (number_guessed == number_in_hand)
if found
	puts "Bulls Eye!"
elsif number_guessed < number_in_hand
	puts "You guess is low"
else
	puts "Your guess is high"
end
end