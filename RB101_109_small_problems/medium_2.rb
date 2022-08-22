=begin
ex. 1 Longest Sentence

text = File.read('sample_text.txt').strip

def split_text(str)
  str.split(/[.!?]/)
end

def longest_sentence(str)
  longest = ''

  split_text(str).each do |ele|
    longest = ele if ele.split.size > longest.split.size
  end
  puts "\"#{longest}\""
  puts ''
  puts "It is #{longest.split.size} words long."
end

puts longest_sentence(text)

ex. 2 Now I Know My ABCs

def block_word?(str)
  letters = %w(B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M)
  word = str.upcase
  word_match_size = 0
  letters.each do |ele|
    word_match_size += 1 if word.include?(ele[0]) || word.include?(ele[-1])
  end
  if word_match_size == word.size
    true
  else
    false
  end
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true

ex. 3 Lettercase Percentage Ratio

def letter_percentages(str)
  { lowercase: ((str.gsub(/[^a-z]/, '').size.to_f / str.size) * 100).round(1),
    uppercase: ((str.gsub(/[^A-Z]/, '').size.to_f / str.size) * 100).round(1),
    neither: ((str.gsub(/[A-Za-z]/, '').size.to_f / str.size) * 100).round(1) }
end

p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('abcdefGHI') #== { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

ex. 4 Matching Parentheses?

#def balanced?(str)
  #return true if str.gsub(/[^()]/, '') == '' 
  #parentheses = str.gsub(/[^()]/, '').chars
  #not_closed = []
  #
  #parentheses.each do |ele|
  #  if ele == '('  
  #    not_closed << ele
  #  elsif ele == ')' && not_closed[-1] == '('
  #    not_closed.pop
  #  elsif ele == '(' && not_closed[-1] == ')'
  #    not_closed.pop
  #  else
  #    not_closed << ')'
  #  end
  #end
#
  #not_closed.empty?
#end

def balanced?(str)
  parens = 0
    str.each_char do |char|
      parens += 1 if char == '('
      parens -= 1 if char == ')'
      break if parens < 0
    end
  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

ex. 5 Triangle Sides

def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3].sort

  case
  when sides.any? { |ele| ele <= 0 }
    :invalid
  when sides[0] + sides[1] < sides[2]
    :invalid
  when sides.uniq.size == 1
    :equilateral
  when sides.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid

ex. 6 Tri-Angles

def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3]

  case
  when sides.sum != 180, sides.include?(0)
    :invalid
  when sides.all? { |side| side < 90 }
    :acute
  when sides.include?(90)
    :right
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

ex. 7 Unlucky Days

require 'date'
def friday_13th(year)
  fridays = 0
  (1..12).to_a.each do |m|
    fridays += 1 if Date.new(year,m,13).friday?
  end
  fridays
end

p friday_13th(2015) #== 3
p friday_13th(1986) #== 1
p friday_13th(2019) #== 2

ex. 8 Next Featured Number Higher than a Given Value

def featured(num)
  featured = num
  loop do
    featured += 1
    if featured % 7 == 0 &&
       featured.to_s.size == featured.to_s.chars.uniq.join.size &&
       featured.odd?
    then
      return featured
    end 
    if featured >= 9_999_999_999
      return "There is no possible number that fulfills those requirements"
    end
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

ex. 9 Bubble Sort

def bubble_sort!(ary)
  n = 0
  no_swap = 0
  loop do
    if ary[n] > ary[n + 1] && ary[n] != ary[-1]
      ary[n], ary[n + 1] = ary[n + 1], ary[n]
    elsif ary[n] <= ary[n + 1]
      no_swap += 1
    end
    break if no_swap == ary.size - 1
    n += 1
    n = 0 if n + 1 == ary.size
    no_swap = 0 if n == 0
  end
  ary
end

array = [5, 3, 3]
p bubble_sort!(array)
p array == [3, 3, 5]

array = [6, 2, 7, 1, 4, 2]
p bubble_sort!(array)
p array == [1, 2, 2, 4, 6, 7]

array = %w(Sue Pete Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Pete Rachel Sue Tyler)

ex. 10 Sum Square - Square Sum

def sum_square_difference(num)
  sum_square = (1..num).to_a.sum ** 2
  square_sum = (1..num).to_a.map do |i|
    i**2
  end.sum

  sum_square - square_sum
end

p sum_square_difference(3) #== 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) #== 2640
p sum_square_difference(1) #== 0
p sum_square_difference(100) #== 25164150
=end
