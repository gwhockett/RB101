=begin

#ex 1

def ascii_value(string)
  a = string.chars.map { |n| n.ord }
  a.sum
end

puts ascii_value('Four score')
puts ascii_value('Launch School')
puts ascii_value('a')

puts "R".ord

puts 82.chr

# ex 2

def time_of_day(num)
  a = num % 1440
  b = "0" + (a / 60).to_s
  c = "0" + (a % 60).to_s
  b.delete_prefix!("0") if b.length > 2
  c.delete_prefix!("0") if c.length > 2
  b + ":" + c
end

# ex 3 

def after_midnight(string)
  if ((string[0,2].to_i * 60) + (string[-2,2].to_i)) == 1440
    0
  else
    (string[0,2].to_i * 60) + (string[-2,2].to_i)
  end
end

def before_midnight(string)
  1440 - ((string[0,2].to_i * 60) + (string[-2,2].to_i))
end

after_midnight('24:00')
before_midnight('24:00')

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
end

# ex 4

def swap(string)
  a = string.lines(' ',chomp: true).map do |n|
    if n.length < 2
      n
    else
      n = n.delete(n[0]).delete(n[-1]).prepend(n[-1]).concat(n[0])
    end
  end

  a.join(' ')
end

swap('Oh what a wonderful day it is')

# ex 5

def cleanup(string)
  a = string.chars.map do |n|
    n.sub(/[^a-z]/, ' ')
  end
  a.join.squeeze(" ")
end

cleanup("---what's my +*& line?")

ALPHABET = ('a'..'z').to_a

def clearup(text)
  clean_chars = []
  
  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

# ex 6

def word_sizes(string)
  sizes = {}
  a = string.split(' ').map do |n|
    n.size
  end

  b = a.uniq.each do |element|
    sizes[element] = a.count(element)
  end

  p sizes
end

word_sizes('')

# ex 7

def ls_word_sizes(words_string)
  count = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-Z')
    counts[clean_word.size] += 1
  end
  counts
end

# ex 8

ALPHA_NUM = %w(zero one two three four five six seven eight nine ten eleven
               twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by! { |index| ALPHA_NUM[index] }
end

p alphabetic_number_sort([2,3,0,1,9,4,2,5,8])

def crunch(string)
  a = string.chars
  b = []
  a.each do |n|
    b << n unless n == b.last
  end
  
  b.join
end

p crunch('ddaaiillyy  ddoouubbllee')

=end

# ex 9

def print_in_box(string)
  top_bottom = '+--+'
  middle = '|  |'
  spacer = '|  |'
  
  (string.size).times {"#{top_bottom.insert(2,'-')}"}
  (string.size).times {"#{spacer.insert(2,' ')}"}
  middle.insert(2, string)
  puts top_bottom
  puts spacer
  puts middle
  puts spacer
  puts top_bottom
end

print_in_box('To boldly go where no one has gone before.')