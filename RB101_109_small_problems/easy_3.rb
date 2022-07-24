=begin
ex. 1 Searching 101

ordinal =  %w(1st 2nd 3rd 4th 5th last)
numbers = []

loop do
  puts "==> Enter the #{ordinal.shift} number:"
  numbers << gets.chomp.to_i
  break if ordinal.size == 0
end

last = numbers.pop

if numbers.include?(last)
  puts "The number #{last} appears in #{numbers}."
else
  puts "The number #{last} does not appear in #{numbers}."
end

ex. 2 Arithmetic Integer

puts "==> Enter the first number:"
first = gets.chomp.to_i
puts "==> Enter the second number:"
second = gets.chomp.to_i
puts "==> #{first} + #{second} = #{first + second}"
puts "==> #{first} - #{second} = #{first - second}"
puts "==> #{first} * #{second} = #{first * second}"
puts "==> #{first} / #{second} = #{first / second}"
puts "==> #{first} % #{second} = #{first % second}"
puts "==> #{first} ** #{second} = #{first ** second}"

ex. 3 Counting the number of characters

print "Please write a word or multiple words: "
words = gets.chomp
character_count = words.split.join.size
puts "There are #{character_count} characters in \"#{words}\"."

ex. 4 Multiply two numbers

def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15

p multiply([1,3], 0)

ex. 5 Squaring an argument

def multiply(num1, num2)
  num1 * num2
end

def power_to_the_n(base, exponent)
  total = 1
  exponent.times do |_|
    total = multiply(base, total)
  end
  total
end

p power_to_the_n(5, 3)

ex. 6 Exclusive Or

def xor?(first, second)
  if !!first == !second
    true
  else
    false
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

ex. 7 Odd list

def oddities(ary)
  odds = []
  index = 0
  loop do
    break if ary[index] == nil
    odds << ary[index]
    index += 2
  end
  odds
end

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])

ex. 8 Palindromic Strings part 1

def palindrome?(stuff)
  stuff == stuff.reverse
end

p palindrome?('madam')
p palindrome?('Madam')          # (case matters)
p palindrome?("madam i'm adam") # (all characters matter)
p palindrome?([2, 3, 4, 5, 6])
p palindrome?([1, 1, 1, 1, 1])

ex. 9 Palindromic Strings part 2

def real_palindrome?(string)
  strung = string.split(/[^a-zA-Z0-9]/).join.downcase
  strung.reverse == strung
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

ex. 10 Palindromic Number

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

=end