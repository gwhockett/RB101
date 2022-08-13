=begin
ex. 1 Rotation (Part 1)

def rotate_array(ary)
  #rotate = []
  #ary.each do |ele|
  #  rotate << ele
  #end
  #rotate << rotate.first
  #rotate.shift
  #rotate
  #ary[1..-1] << ary[0]
  ary[1..-1] + [ary[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) #== ['b', 'c', 'a']
p rotate_array(['a']) #== ['a']

x = [1, 2, 3, 4]
p rotate_array(x) #== [2, 3, 4, 1]   # => true
p x #== [1, 2, 3, 4]                 # => true

ex. 2 Rotation (Part 2)

def rotate_rightmost_digits(num, n)
  ary = num.to_s.chars
  tail = ary[-n..-1]
  head = ary - tail
  tail = tail[1..-1] + [tail[0]]
  (head + tail).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

ex. 3 Rotation (Part 3)

def rotate_rightmost_digits(num, n)
  ary = num.to_s.chars
  tail = ary[-n..-1]
  head = ary - tail
  tail = tail[1..-1] + [tail[0]]
  (head + tail).join.to_i
end

def max_rotation(num)
  digit_size = (num.to_s.size)  
  rotated = num
    loop do
      rotated = rotate_rightmost_digits(rotated, digit_size)
      digit_size -= 1
      break if digit_size == 0
    end
  rotated
end


p max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(35) #== 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845

ex. 4 1000 lights

def light_switch_array_size(num)
  ary = []
  num.times {|_| ary << false }
  ary
end

lights = light_switch_array_size(1000)

def light_alternator(ary)
  alternate = 1
  loop do
    ary.each_index do |index|
      ary[index] = !ary[index] if (index + 1) % alternate == 0
    end
    break if alternate == ary.size
    alternate += 1
  end
  ary
end

switched = light_alternator(lights)

def whats_on(ary)
  on = []
  ary.each_index do |light|
    on << light + 1 if ary[light]
  end
  on
end

p whats_on(switched) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169,
                         196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576,
                         625, 676, 729, 784, 841, 900, 961]

ex. 5 Diamonds!

def diamond_size(n)
  a = (1..n).to_a + (1..n-1).to_a.reverse
  a.delete_if do |ele|
    ele % 2 == 0
  end
end

def diamonds(n)
  diamond_size(n).each do |stars|
    spaces = (n - stars) / 2
    head = ''; middle = ''; tail = ''
    spaces.times do |_|
      head << ' '; tail << ' '
    end
    stars.times do |_|
      middle << '*'
    end
    puts head + middle + tail
  end
end

diamonds(9)
diamonds(7)
diamonds(5)
diamonds(3)
diamonds(1)

ex. 6 Stack Machine Interpretation

def minilang(str)
  register = 0
  stack = []
  str.split.each do |ele|
    case ele
    when 'PUSH' then stack << register
    when 'ADD' then register = (register + stack.pop)
    when 'SUB' then register = (register - stack.pop)
    when 'MULT' then register = (register * stack.pop)
    when 'DIV' then register = (register / stack.pop)
    when 'MOD' then register = (register % stack.pop)
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    else register = ele.to_i
    end
  end
end

minilang('PRINT')
# 0
puts ''
minilang('5 PUSH 3 MULT PRINT')
# 15
puts ''
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts ''
minilang('5 PUSH POP PRINT')
# 5
puts ''
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts ''
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts ''
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts ''
minilang('-3 PUSH 5 SUB PRINT')
# 8
puts ''
minilang('6 PUSH')
# (nothing printed; no PRINT commands)

ex. 7 Word to Digit

NUMBERS = { 'zero' => '0',
            'one' => '1',
            'two' => '2',
            'three' => '3',
            'four' => '4',
            'five' => '5',
            'six' => '6',
            'seven' => '7',
            'eight' => '8',
            'nine' => '9' }

def word_to_digit!(str) # mutating
  NUMBERS.each do |key, value|
    str.gsub!(key, value)
  end
  str
end

def word_to_digit(str) # non mutating
  str.split.each do |word|
    NUMBERS.each do |key, value|
      word.gsub!(key, value)
    end
  end.join(' ')
end
a = 'Please call me at five five five one two three four. Thanks.'
p a.object_id
p word_to_digit!(a).object_id #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit(a).object_id

ex. 8 Fibonacci Numbers (Recursion)

def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end

def fibonacci(number) #(Recursion)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

p fibonacci(1) #== 1
p fibonacci(2) #== 1
p fibonacci(3) #== 2
p fibonacci(4) #== 3
p fibonacci(5) #== 5
p fibonacci(12) #== 144
p fibonacci(20) #== 6765

ex. 9 Fibonacci Numbers (Procedural)

def fibonacci(number) #(Procedural)
  first, last = [1, 1]

  3.upto(number) do |_|
    first, last = last, first + last
  end
  last
end

p fibonacci(5) #== 6765
p fibonacci(100) #== 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

ex. 10 Fibonacci Numbers (Last Digit)

def fibonacci(number) #(Procedural)
  first, last = [1, 1]
  if number < 1000
    3.upto(number) do |_|
      first, last = last, first + last
    end
    last
  else
    3.upto(number % 10) do |_|
      first, last = last, first + last
    end
    last
  end
end

def fibonacci_last(num)
  '011235831459437077415617853819099875279651673033695493257291'[num%60].to_i
end

#def fibonacci_last(number)
  #fibonacci(number).to_s[-1].to_i
#end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789987745) # -> 5
=end