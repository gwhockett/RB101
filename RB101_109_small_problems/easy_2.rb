=begin
ex. 1 How old is Teddy?

puts "Who's birthday is it?"

birthday_person = gets.chomp

def years_age(it = 'Teddy')
  "#{it} is #{rand(20..200)} years old!"
end

if birthday_person == ''
  puts years_age
else
  puts years_age(birthday_person)
end

ex. 2 How big is the room?

def area_of_room(l, w)
  l * w
end

def area_of_room_feet(a)
  (a * 10.7639).round(3)
end

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i
puts "Enter the width of the room in meters:"
width = gets.chomp.to_i

area = area_of_room(length, width)
area_feet = area_of_room_feet(area)

puts "The area of the room is #{area} square meters (#{area_feet} square feet)."

ex. 3 Tip calculator

puts "How much is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
percent = gets.chomp.to_f

def tip_amount(b, p)
  b * (p/100)
end

tip = tip_amount(bill, percent).round(2)
tip_formatted = sprintf("%0.2f", tip)
total_formatted = sprintf("%.2f",bill + tip)

puts "The tip is $#{tip_formatted}"
puts "The total is $#{total_formatted}"

ex. 4 When will I retire?

print "What is your age? "
age = gets.chomp.to_i

print "What age would you like to retire? "
retirement_age = gets.chomp.to_i

retirement_gap = retirement_age - age

puts "Its #{Time.now.year}. You will retire in #{retirement_gap + Time.now.year}."
puts "You only have #{retirement_gap} years to go!"

ex. 5 Gretting a user

print "What is your name? "

name = gets.chomp

if name.end_with?("!")
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

ex. 6 Odd numbers

1.upto(99) {|i| puts i if i.odd?}

ex. 7 Even numbers

1.upto(99) {|i| puts i if i.even?}

ex. 8 Sum or Product of Consecutive Integers

def greeting(msg)
  puts ">> #{msg}"
end

def arrayed_number(num)
  (1..num).to_a
end

number = 0

loop do
  greeting "Enter an Integer greater than 0:"

  number = gets.chomp.to_i
  break if number > 0
  greeting "That's is not a valid entry!"
end

procedure = ''

loop do
  greeting "Enter 's' to compute the sum."
  greeting "Enter 'p' to compute the product."

  procedure = gets.chomp.downcase

  break if procedure == 's' || procedure == 'p'
  greeting "That's is not a valid entry!"
end

operand = arrayed_number(number)

if procedure == 's'
  puts "The sum of the integers between 1 and #{number}"
  puts "is #{operand.inject(:+)}."
else
  puts "The product of the integers between 1 and #{number}"
  puts "is #{operand.inject(:*)}."
end

ex. 9 String assignment

# The variable name is assigned to the object 'Bob'
# The variable same_name is assigned to the object 'Bob' via
# the variable name.
# name then calls the mutating method #upcase! to change the object 'Bob'
# to "BOB"
# Hence both name and same_name both still point to the mutated object they
# both output the same result.

ex. 10 Mutation

# array2 would output all the element strings that start with a 'C' or an 'S' as all caps.
# since #upcase! is a mutating method that directly mutates the elements within array1
# and array2. While array1 and array2 are different objects themselves their respective
# elements have the same object_ids.
=end