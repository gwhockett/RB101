=begin

ex. 1 repeat yourself

def repeat(string, num)
  num.times { |_| puts string }
end

repeat('Hello', 3)

ex. 2 odd

def is_odd?(num)
  num.remainder(2).abs == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

=end
ex. 3 List of Digits

def digit_list(num)
  num.to_s.chars.map do |i|
    i.to_i
  end
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
=begin
ex. 4 How many?

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  auto_types_count = {}
  arr.each do |auto|
    if auto_types_count.has_key?(auto)
      auto_types_count[auto] += 1
    elsif
      auto_types_count[auto] = 1
    end
  end
  auto_types_count.each do |key, value|
    puts "#{key} => #{value}"
  end
end

count_occurrences(vehicles)

ex. 5 Reverse It (Part 1)

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

p reverse_sentence('Hello World')

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

ex. 6 Reverse It (Part 2)

def reverse_words(string)
  words = string.split
  words_reversed =
  words.map do |word|
    if word.size > 4
      word.reverse
    else
      word
    end
  end
  words_reversed.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

ex. 7 Stringy Strings

def stringy(num, invert = 1)
  bit = []
  
  if invert == 1
    num.times do |i|
      i.even? ? bit << '1': bit << '0'
    end
  elsif invert == 0
    num.times do |i|
      i.odd? ? bit << '1': bit << '0'
    end
  end

  bit.join
end

puts stringy(6)
puts stringy(9)
puts stringy(4)
puts stringy(7)

puts stringy(6, 0)
puts stringy(9, 0)
puts stringy(4, 0)
puts stringy(7, 0)

ex. 8 Array Average

def average(arry)
  (arry.sum / arry.size.to_f).round(4)
end

puts average([1, 6]) == 3.5
puts average([1, 5, 87, 45, 8, 8]) == 25.6667
puts average([9, 47, 23, 95, 16, 52]) == 40

ex.9 Sum of Digits

def digit_list(num)
  num.to_s.chars.map do |i|
    i.to_i
  end
end

def sum(num)
  digit_list(num).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

ex. 10 What's my bonus?

def calculate_bonus(num, boole)
  if boole == true
    num / 2
  else
    0
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
=end
