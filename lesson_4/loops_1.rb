=begin
Runaway loop

loop do
  puts 'Just keep printing...'
  break
end

Loopception

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'

Control the loop

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations == 5
  iterations = iterations + 1
end

Loop on Command

loop do
  puts 'Should I stop looing?'
  answer = gets.chomp
  break if answer == 'yes'
end

Say Hello

say_hello = true
count = 1

while say_hello
  puts 'Hello!'
  say_hello = false if count == 5
  count += 1
end

Print While

numbers = []

while numbers.size < 5
  numbers << rand(0..99)
  puts numbers.last
end

Count Up

count = 1

until count == 11
  puts count
  count += 1
end

Print Until

numbers = [7, 9, 13, 25, 18]
count = 0

until count == numbers.size
  puts numbers[count]
  count += 1`
end

That's odd

for i in 1..100
  puts i if i.odd?
end

Greet your Friends

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for i in 0...friends.size
  puts "Hello, #{friends[i]}!"
end

for friend in friends
  puts "Hello, #{friend}!"
end
=end