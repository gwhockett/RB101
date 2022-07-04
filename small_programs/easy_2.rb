=begin
ex 1
puts "Teddy is #{rand(20..200)} years old!"

ex 2
SQMETERS_TO_SQCENTIMETERS = 10000
SQMETERS_TO_SQFEET = 10.7639
SQMETERS_TO_SQINCHES = 1550

puts "Enter the length of the room in meters:"
l = gets.chomp.to_i

puts "Enter the width of the room in meters:"
w = gets.chomp.to_f

square_meters = (l * w).round(2)
square_centimeters = (square_meters * SQMETERS_TO_SQCENTIMETERS).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)
square_inches = (square_meters * SQMETERS_TO_SQINCHES).round(2)

puts "The area of the room is:"
puts "#{square_meters} square meters,"
puts "#{square_centimeters} square centimeters,"
puts "#{square_feet} square feet,"
puts "#{square_inches} square inches."

ex 3

print "How much is the bill? "
bill = gets.chomp.to_f

print "What is the tip percentage? "
tip_rate = gets.chomp.to_f

tip = bill * (tip_rate / 100).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{sprintf("%.2f",tip)}"
puts "The total is $#{sprintf("%.2f",total)}"

ex 4

print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

current_year = Time.now.year
years_to_retirement = retirement_age - age
retirement_year = current_year + years_to_retirement

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_to_retirement} years of work to go!"

ex 5

print "What is your name? "
name = gets.chomp

#name.include?("!") ? (puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?") : (puts "Hello #{name}.")

if name[-1] =='!'
  name = name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

ex 6
(1...100).each {|n| puts n if n.odd?}

(0..100).select {|n| puts n if n % 2 == 1}

# ex 7

(1..99).each {|n| puts n if n.even?}

=end

num = nil
operation = nil

loop do
  puts ">> Please enter an integer greater than 0:"
  num = gets.chomp.to_i

  break if num >= 1
end

loop do
  puts ">> Please enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase

  break if operation == 's' || operation == 'p'
end

if operation == 's'
  puts "The sum of the integers between 1 and #{num} is #{(1..num).sum}."
else
  puts "The product of the integers between 1 and #{num} is #{(1..num).reduce(:*)}."
end
