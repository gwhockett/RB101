=begin
ex 1
def repeat(str, num)
  num.times {puts str}
end

puts "Term to repeat?"
string = gets.chomp
puts "How many times?"
number = gets.chomp.to_i

repeat(string, number)

ex 2

def is_odd(number)
  number % 2 == 1
end

num = gets.chomp.to_i

puts is_odd(num)

ex 3

def digit_list(num)
  num.to_s.chars.map {|s| s.to_i}
end

puts digit_list(12345) == [1, 2, 3, 4, 5]

ex 4

=end

vehicles = %w(car car truck car SUV truck motorcycle
              motorcycle car truck)

vehicles.tally
=begin
def count_occurances(array)
  occurances = {}

  array.uniq.each do |element|
    occurances[element] = array.count(element)
  end

  occurances.each do |element, count|
    puts "#{element} => #{count}"
  end
end


count_occurances(vehicles)

ex 5

def reverse_sentence(sentence)
  sentence.to_s.scan(/[[:alnum:]]/).reverse.join
end

puts reverse_sentence("Madam, I'm Adam")

ex 6

def reverse_words(words)
  a = words.split
  a.each do |word|
    if word.length > 4
      word.reverse!
    end
  end
  puts a.join(' ')
end

reverse_words("Hello to the World!")

ex 7

def stringy(num, invert = nil)
  a = ''
  b = 0
  loop do
    break if b == num 
    b += 1
    if (b % 2 == 1 && invert == nil)
      a << '1'
    elsif (b % 2 == 0 && invert == nil)
      a << '0'
    elsif (b % 2 == 1 && invert != nil)
      a << '0'
    elsif (b % 2 == 0 && invert != nil)
      a << '1'
    end
  end
  return a
end

puts stringy(7) == '1010101'
puts stringy(7, 'whatever') == '0101010'
puts stringy(7, 3.1415) == '0101010'

ex 8

def average(array)
  array.sum / array.size.to_f
end

p average([10, 3, 3])

ex 9

def sum(num)
  num.to_s
     .chars
     .map(&:to_i)
     .sum
end

puts sum(123_456_789) == 45

ex 10

def calculate_bonus(salary, bonus)
  bonus ? salary / 2 : salary = 0
end

puts calculate_bonus(5000, true) == 2500
puts calculate_bonus(5000, false) == 0



def repeat(string, num)
  num.times {puts string}
end

repeat("hello", 3)

=end