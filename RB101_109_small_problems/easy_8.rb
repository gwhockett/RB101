=begin
ex. 1 Sum of Sums

def sum_of_sums(ary)
  counter = 1
  sums = []
  loop do
    sums << ary[0, counter].sum
    break if counter == ary.size
    counter += 1
  end
  sums.sum
end

p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) #== 4
p sum_of_sums([1, 2, 3, 4, 5]) #== 35

ex. 2 Madlibs

print "Enter a noun: " 
noun = gets.chomp
print "Enter a verb: " 
verb = gets.chomp
print "Enter an adjective: " 
adjective = gets.chomp
print "Enter an adverb: " 
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb} #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb} up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample

ex. 3 Leading Substrings

def leading_substrings(string)
  counter = 1
  slices = []
  loop do
    slices << string[0, counter]
    break if counter == string.size
    counter += 1
  end
  slices
end

p leading_substrings('abc') #== ['a', 'ab', 'abc']
p leading_substrings('a') #== ['a']
p leading_substrings('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

ex. 4 All Substrings

def leading_substrings(string)
  counter = 1
  slices = []
  loop do
    slices << string[0, counter]
    break if counter == string.size
    counter += 1
  end
  slices
end

def substrings(strings)
  a = strings
  counter = 0
  sub_strings = []
  loop do
    a = strings[counter..-1]
    sub_strings << leading_substrings(a)
    break if a.size == 1
    counter += 1
  end
  sub_strings.flatten
end

p substrings('abcde')
#[
#  'a', 'ab', 'abc', 'abcd', 'abcde',
#  'b', 'bc', 'bcd', 'bcde',
#  'c', 'cd', 'cde',
#  'd', 'de',
#  'e'
#]

ex. 5 Palindromic Substrings

def leading_substrings(string)
  counter = 1
  slices = []
  loop do
    slices << string[0, counter]
    break if counter == string.size
    counter += 1
  end
  slices
end

def substrings(strings)
  a = strings
  counter = 0
  sub_strings = []
  loop do
    a = strings[counter..-1]
    sub_strings << leading_substrings(a)
    break if a.size == 1
    counter += 1
  end
  sub_strings.flatten
end

def palindromes(str)
  dromes = []
  substrings(str).each do |ele|
    if ele == ele.reverse && ele.size > 1
      dromes << ele
    end
  end
  dromes
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

ex. 6 fizzbuzz

def list_zz(ary)
  ary.map do |ele|
    if ele == ary.last
      ele
    else
      ele + ', '
    end
  end.join
end

def fizzbuzz(num1, num2)
  ary = (num1..num2).to_a
  zz = ary.map do |ele|
    if ele % 3 == 0 && ele % 5 != 0
      'Fizz'
    elsif ele % 5 == 0 && ele % 3 != 0
      'Buzz'
    elsif ele % 5 == 0 && ele % 3 == 0
      'FizzBuzz'
    else
      ele.to_s
    end
  end
  list_zz(zz)
end

puts fizzbuzz(1, 15)# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

ex. 7 Double Char (Part 1)

def repeater(string)
  string.chars.map { |ele| ele * 2 }.join
end

puts repeater('Hello') #== "HHeelllloo"
puts repeater("Good job!") #== "GGoooodd  jjoobb!!"
puts repeater('') #== ''

ex. 8 Double Char (Part 2)

def double_consonants(string)
  string.chars.map do |ele|
    if ele =~ /[a-z]/i && ele =~ /[^aeiou]/
      ele * 2
    else
      ele
    end
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

ex. 9 Reverse the Digits In a Number

def reversed_number(num)
  num.to_s.reverse.to_i
  # srebmun = 0
  # num_ary = num.to_s.chars.map(&:to_i)
  # power = num_ary.size - 1
  # num_ary.reverse_each do |ele|
  #   srebmun += (10 ** power) * ele
  #   power -= 1
  # end
  # srebmun
end

p reversed_number(12345) #== 54321
p reversed_number(12213) #== 31221
p reversed_number(456) #== 654
p reversed_number(12000) #== 21 # No leading zeros in return value!
p reversed_number(12003) #== 30021
p reversed_number(1) #== 1

ex. 10 Get The Middle Character

def center_of(string)
  mid = string.size / 2
  if string.size.odd?
    string[mid]
  else
    string[mid - 1, 2]
  end
end

puts center_of('I love ruby') #== 'e'
puts center_of('Launch School') #== ' '
puts center_of('Launch') #== 'un'
puts center_of('Launchschool') #== 'hs'
puts center_of('x') #== 'x'
=end