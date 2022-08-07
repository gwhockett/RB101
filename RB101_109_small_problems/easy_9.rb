=begin
ex. 1 Welcome Stranger

def greetings(ary, hash)
  "Hello, #{ary.join(' ')}! Nice to have a #{hash[:title]} "\
  "#{hash[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.

ex. 2 Double Doubles

def twice(num)
  ary = num.to_s.chars
  halves = ary[0, ary.size / 2] == ary[ary.size / 2, ary.size / 2]
  if halves == true && ary.size.even?
    num
  else
    num * 2
  end
end

p twice(37)# == 74
p twice(44) #== 44
p twice(334433) #== 668866
p twice(444) #== 888
p twice(107) #== 214
p twice(103103) #== 103103
p twice(3333) #== 3333
p twice(7676) #== 7676
p twice(123_456_789_123_456_789)# == 123_456_789_123_456_789
p twice(5) #== 10

ex. 3 Always Return Negative

def negative(num)
  num > 0 ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

ex. 4 Counting Up

def sequence(num)
  num > 0 ? (1..num).to_a : (num..num.abs).to_a
end

p sequence(5) #== [1, 2, 3, 4, 5]
p sequence(-3) #== [-3, -2, -1]
p sequence(-1) #== [-1]

ex. 5 Uppercase Check

def uppercase?(string)
  #lowers = string.chars.select do |ele|
  #  ele =~ /[a-z]/
  #end
  #if lowers.size > 0
  #  false
  #else
  #  true
  #end
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

ex .6 How long are you?

def word_lengths(string)
  string.split.map { |word| word << " #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
 
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
 
p word_lengths("Supercalifragilisticexpialidocious") ==
   ["Supercalifragilisticexpialidocious 34"]
 
p word_lengths("") == []

ex. 7 Name Swapping

def swap_name(name_string)
  name_string.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

ex. 8 Sequence Count

def sequence(step, size)
  #ary = []
  #amount = size
  #step.times do |i|
  #  ary << size
  #  size += amount
  #end
  #ary
  (1..step).map { |value| value * size }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

ex. 9 Grade book

def get_grade(num1, num2, num3)
  grades = []
  
  grades << num1
  grades << num2
  grades << num3

  score = grades.sum / 3

  case score
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

ex. 10 Grocery List

def buy_fruit(ary)
  #list = []
  #ary.each do |item|
  #  item[1].times do |_|
  #    list << item[0]
  #  end
  #end
  #list
  ary.map { |item, amount| [item] * amount }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

ex. 11 Group Anagrams

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def anagrams(ary)
  anagrams = {}
  ary.each do |word|
    if anagrams.has_key?(word.chars.sort.join)
      anagrams[word.chars.sort.join] << word
    else
      anagrams[word.chars.sort.join] = [word]
    end
  end
  anagrams
end

anagrams(words).each do |key, value|
  p value
end
=end