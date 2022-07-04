=begin
# ex 1
def short_long_short(string1, string2)
  a = string1.length
  b = string2.length
  if a < b
    string1 + string2 + string1
  elsif b < a
    string2 + string1 + string2
  else
    string1 + string2 + string2
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

# ex 2

def century(year)
  a = year / 100.to_f
  b = year / 100 + 1

  if a + 1 > b
    integer = b.to_s
  else
    integer = (b - 1).to_s
  end
  ordinal(integer)
end

def ordinal(century)
  if century.end_with?("1") && !century.end_with?("11")
    century + "st"
  elsif century.end_with?("2") && !century.end_with?("12")
    century + "nd"
  elsif century.end_with?("3") && !century.end_with?("13")
    century + "rd"
  else
    century + "th"
  end
end

puts century(9) == "1st"
puts century(10) == "1st"
puts century(100) == "1st"
puts century(101) == "2nd"
puts century(199) == "2nd"
puts century(200) == "2nd"
puts century(201) == "3rd"
puts century(999) == "10th"
puts century(1059) == "11th"
puts century(1189) == "12th"
puts century(1230) == "13th"
puts century(1999) == "20th"
puts century(2000) == "20th"
puts century(2001) == "21st"

# ex 3 and 4

def leap_year?(year)
  if year >= 1752
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  elsif year < 1752 && year % 4 == 0
    true
  else
    false
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true

# ex 5

def multisum(num)
  (1..num).map do |n|
    n if n % 3 == 0 || n % 5 == 0
  end.compact.sum
end

p multisum(3)
p multisum(5)
p multisum(10)
p multisum(1000)

# ex 6

def running_total(array)
  a = array.reverse
  b = []
  b << a.pop
  loop do
    b << b.last + a.pop
    break if a.none?
  end
  b
end

def running_total_ls(array)
  sum = 0
  array.map { |n| sum += n }
end
p running_total([2, 3, 4, 5])
p running_total([14, 11, 7, 15, 20])
p running_total_ls([14, 11, 7, 15, 20])

# ex 7

DIGITS = {'0'=>0, '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7,
          '8'=>8, '9'=>9, 'A'=>10, 'B'=>11, 'C'=>12, 'D'=>13, 'E'=>14, 'F'=>15
          '-'=> -}

def string_to_integer(string)
  a = string.upcase.chars.map { |n| DIGITS[n] }
  b = 0
  loop do
    b += 16 ** (a.size - 1) * a.shift
    break if a.none?
  end
  b
end

puts string_to_integer("4D9f")

# ex 8

def string_to_integer(string)
  a = string.upcase.chars.map { |n| DIGITS[n] }
  b = 0
  a.shift if string[0] == '-'
  loop do
    b += 10 ** (a.size - 1) * a.shift
    break if a.none?
  end
  return -b if string[0] == '-'
  b
end

DIGITS = {'0'=>0, '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5,
          '6'=>6, '7'=>7, '8'=>8, '9'=>9, '-'=>0, '+'=>0}

def string_to_signed_integer(string)
  string_to_integer(string)
end

puts string_to_integer("-5432")

#ex 9

def integer_to_string(num)
  a = []
  b = 0
  n = 10
  loop do
    a << ((num % n) - b) / (n / 10)
    b = num % n
    n *= 10
    break if num - b == 0 || num + b == 0
  end
  c = a.reverse.map do |n|
        n = DIGITS[n]
  end
  num < 0 ? c.join.prepend('-') : c.join
end

DIGITS = {0=>'0', 1=>'1', 2=>'2', 3=>'3', 4=>'4', 5=>'5',
          6=>'6', 7=>'7', 8=>'8', 9=>'9'}

p integer_to_string(-5000)

=end
