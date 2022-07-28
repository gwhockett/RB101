=begin
ex. 1 ASCII string value

def ascii_value(string)
  sum = 0
  string.chars.each do |i|
    sum += i.ord
  end
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# mystery method - .chr

ex. 2 After Midnight (Part 1)

def time_of_day(minutes)
  format("%02i:%02i", (minutes / 60) % 24, minutes % 60)
end

p time_of_day(0) # "00:00"
p time_of_day(-3) # "23:57"
p time_of_day(35) # "00:35"
p time_of_day(-1437) # "00:03"
p time_of_day(3000) # "02:00"
p time_of_day(800) # "13:20"
p time_of_day(-4231) # "01:29"

ex. 3 After Midnight (Part 2)

def after_midnight(time)
  minutes = []
  time.split(':').each do |i|
    minutes << i.to_i
  end
  minutes[0] *= 60
  after_minutes = minutes.sum
  if after_minutes >= 1440
    after_minutes -= 1440
  else
    after_minutes
  end
end

def before_midnight(time)
  minutes = []
  time.split(':').each do |i|
    minutes << i.to_i
  end
  minutes[0] *= 60
  before_minutes = 1440 - minutes.sum
  if before_minutes >= 1440
    before_minutes -= 1440
  else
    before_minutes
  end
end

p before_midnight('12:34') # 686
p after_midnight('12:34') # 754
p after_midnight('24:00')
p before_midnight('24:00')

ex.4 Letter Swap

def swap(string)
  words = string.split(' ')
  swapped_words = []
  words.map do |letters|
    a = letters[0]
    b = letters[-1]
    letters[0] = b
    letters[-1] = a
  end
  words.join(' ')
end
p swap('Oh what a wonderful day it is')
p swap('Abcde')

ex. 5 Clean up the words

def cleanup(string)
  a = string.gsub(/[^a-z]/, ' ')
  a.gsub(/[^a-z]{2,}/, ' ')
end

p cleanup("---what's my +*& line?")

ex. 6 Letter Counter (Part 1)

def word_sizes(string)
  words_sized = {}
  words_sized.default = 0
  words = string.split(' ')
  words.each do |ele|
      words_sized[ele.size] += 1
  end
  words_sized
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')

ex. 7 Letter Counter (Part 2)

def word_sizes(string)
  words_sized = {}
  words_sized.default = 0
  words = string.split(' ')
  words.each do |ele|
      words_sized[ele.gsub(/[^a-z]/i, '').size] += 1
  end
  words_sized
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')

ex. 8 Alphabetical Numbers

numbers = %w(zero one two three four five six seven eight nine ten
          eleven twelve thirteen fourteen fifteen sixteen seventeen
          eighteen nineteen)
num_hash = {}
index = 0
numbers.each do |ele|
  num_hash[index] = ele
  index += 1
end

ALPHA_NUM = num_hash
NUM_ALPHA = num_hash.invert

def alphabetic_number_sort(ary)
  numbers = []
  ary.each do |ele|
    numbers << ALPHA_NUM[ele]
  end
  numbers.sort.map do |ele|
    ele = NUM_ALPHA[ele]
  end
end

p alphabetic_number_sort((0..19).to_a)

ex. 9 ddaaiillyy ddoouubbllee

def crunch(string)
  ary = string.split('')
  ary_1 = []
  ary.each do |ele|
    if ele != ary_1.last
      ary_1 << ele
    end
  end
  ary_1.join
end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('4444abcabccba')
p crunch('ggggggggggggggg')
p crunch('a')
p crunch('')

ex. 10 Bannerizer

def print_in_box(string)
  a = ''
  b = ''
  c = string
  string.size.times do |ele|
    a << '-'
    b << ' '
  end
  puts "+-#{a}-+"
  puts "| #{b} |"
  puts "| #{c} |"
  puts "| #{b} |"
  puts "+-#{a}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

ex. 11 Spin Me Around In Circles

# While the #reverse! method mutates the individual elements of the array
# create by #split, the #join method creates a new string from those mutated
# elements. The returned string is then a different object than the string
# object passed into the defined method. In addition to this we are prevented
# access to the original object as soon as the #split method is called on the
# original string being that the new array is not the same object as the
# string object.

=end