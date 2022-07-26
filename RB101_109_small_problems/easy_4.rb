=begin
ex. 1 Short Long Short

def short_long_short(str1, str2)
  ary = []
  ary << str1
  ary << str2
  ary.sort_by! {|a| a.size}
  string = ary[0] + ary[1] + ary[0]
end

p short_long_short('abc', 'defgh')
p short_long_short('abcde', 'fgh')
p short_long_short('', 'xyz')

ex. 2 What Century is That?

def century(num)
  century_int = num / 100
  century_int += 1 if num % 100 > 0
  century = century_int.to_s
  case 
  when century[-1] == '1' && century[-2] != '1'
    century + 'st'
  when century[-1] == '2' && century[-2] != '1'
    century + 'nd'
  when century[-1] == '3' && century[-2] != '1'
    century + 'rd'
  else
    century + 'th'
  end
end

puts century(2000)
puts century(2001)
puts century(1965)
puts century(256)
puts century(5)
puts century(10103)
puts century(1052)
puts century(1127)
puts century(11201)

ex. 3 Leap Years Part 1

def leap_year?(year)
  case
  when year % 4 == 0 && year % 100 != 0
    true
  when year % 400 == 0
    true
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

ex. 4 Leap Years part 2

def leap_year?(year)
  case
  when year % 4 == 0 && year % 100 != 0 && year > 1751
    true
  when year % 400 == 0 && year > 1751
    true
  when year % 4 == 0 && year < 1752
    true
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

ex. 5 Multiples of 3 and 5

def multisum(num)
  sum = 0
  1.upto(num) do |i|
    sum += i if i % 3 == 0 && i % 5 != 0
    sum += i if i % 5 == 0
  end
  sum
end

p multisum(20)
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

ex. 6 Running totals

def running_total(ary)
  totaled = []
  ary.each do |i|
    if totaled.last == nil
      totaled << i
    else
      totaled << i + totaled.last
    end
  end
  totaled
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])

ex. 7 Convert a String to a Number!

NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9}

def string_to_integer(string)
  sum = 0
  num = string.split('')
  integers = num.map do |i|
               NUMBERS[i]
             end
  count = integers.size
  loop do
    sum += (10 ** (count-1)) * (integers[-count])
    count -= 1
    break if count == 0
  end
  sum
end

p string_to_integer('1234')
p string_to_integer('4321')
p string_to_integer('570')

ex. 8 Convert a string to a signed number!

NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5'=> 5, '6'=> 6,
           '7'=> 7, '8'=> 8, '9'=> 9, '+' => 0, '-' => 0}

def string_to_integer(string)
  sum = 0
  integers = string.split('').map do |i|
               NUMBERS[i]
             end
  count = integers.size
  count -= 1 if integers[0] == 0
  loop do
    sum += (10 ** (count-1)) * (integers[-count])
    count -= 1
    break if count == 0
  end
  if string[0] == '-'
    sum * -1
  else
    sum
  end
end
p string_to_integer('-1234')
p string_to_integer('4321')
p string_to_integer('+570')

ex. 9 & 10 Convert a number to string!

def integer_to_string(num)
  if num < 0
    extractee = -num
  else
    extractee = num
  end
  extractor = 10
  extractors = []
  extracted = []
  loop do
    extractors << extractor
    extracted << extractee % extractor
    extractee -= extractee % extractor
    break if extractee == 0
    extractor *= 10
  end
  extracted.reverse!
  extractors.map! do |i|
    i / 10
  end
  string_num = extracted.map! do |i|
                 i / extractors.pop
               end.join
  if num < 0
    string_num.prepend('-')
  elsif num > 0
    string_num.prepend('+')
  else
    string_num
  end
end

p integer_to_string(-4321)
p integer_to_string(0)
p integer_to_string(5000)
=end