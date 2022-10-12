=begin
Even or Odd?

count = 1

loop do
  count.odd? ? (puts "#{count} is odd!") : (puts "#{count} is even!")
  count += 1
  break if count > 5
end

Catch the Number

loop do
  number = rand(100)
  puts number
  break if (0..10).include?(number)
end

Conditional Loop

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed"
    break
  end
else
  puts "The loop wasn't processed!"
end

Get the Sum

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else
    puts "Wrong answer. Try again!"
  end
end

Insert Numbers

numbers = []

loop do
  puts 'Enter any number:'
  numbers << gets.chomp.to_i
  break if numbers.size == 5
end
puts '', numbers

Empty the Array

names = ['Sally', 'Joe', 'Lisa', 'Henry']

until names.empty?
  puts names.shift
end

Stop Counting

5.times do |index|
  puts index
  break if index == 2
end

Only Even

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

First to Five

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  next if number_a != 5 && number_b != 5
  puts "5 was reached!"
  break
end

Greeting

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
=end