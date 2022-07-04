=begin

ex 1
rescue => exception
  
end

numbers = []

['1st', '2nd', '3rd', '4th', '5th', 'last'].each do |n|
  puts "==> Enter the #{n} number:";
  numbers << gets.chomp.to_i    
end

if numbers.first(5).include?(numbers.last)
  puts "The number #{numbers.last} appears in #{numbers.first(5)}."
else
  puts "The number #{numbers.last} does not appear in #{numbers.first(5)}."
end

ex 2


operations = %w(+ - * / % **)

puts "==> Enter the first number:"
first = gets.chomp.to_i

puts "==> Enter the second number:"
second = gets.chomp.to_i

operations.each do |op|
  puts "#{first} #{op} #{second} = #{[first, second].reduce(op.to_sym)}"
end

ex 3

print "Please enter a word or multiple words: "
characters = gets.chomp

result = characters.chars.reject{|word| word.start_with?(' ')}.count

puts "There are #{result} characters in \"#{characters}\"."


ex 4

def multiply(n1, n2)
  n1 * n2
end

puts multiply(5, 3) == 15

#ex 5

def square(n)
  multiply(n, n)
end

puts square(-4) == 16

def base_to_power(base, power)
  iteration = base
  return 1 if power == 0
  loop do
    break if power == 1
    power -= 1
    iteration = multiply(iteration, base)
  end
  iteration
end

puts base_to_power(8, 3) == 512

#6

def xor?(a, b)
  if a == true && b == false
    true
  elsif a == false && b == true
    true
  else
    false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

#ex 7

def oddities(array)
  odd_index = []
  index = 0
  while index < array.size
    odd_index << array[index]
    index += 2
  end
  odd_index
end

puts oddities([1,2,3,4,5,6,7])

# ex 8

def palindrome?(string_or_array)
  string_or_array == string_or_array.reverse
end

puts palindrome?([1, 2, 3, 2, 1]) == true
puts palindrome?([1, 2, 3, 4]) == false
puts palindrome?("racecar") == true
puts palindrome?("hello") == false

=end

# ex 9

def real_palindrome?(sentence)
  a = sentence.to_s.downcase.scan(/[[:alnum:]]/).join
  a == a.reverse
end

puts real_palindrome?(123210) == false