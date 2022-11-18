=begin

Ruby Collections: Additional Practice

# 1
flintstones = %w[Fred Barney Wilma Betty Pebbles BamBam]

a = flintstones.each_with_object({}) do |value, key|
  key[value] = flintstones.index(value)
end

p a

b = []

flintstones.each_with_index do |key, value|
  b << [key, value]
end

p b.to_h

c = {}

flintstones.each_with_index do |key, value|
  c[key] = value
end

p c

counter = 0
d = {}

loop do
  break if counter == flintstones.size

  d[flintstones[counter]] = counter
  counter += 1
end

p d

counter2 = 0
e = []

loop do
  break if counter2 == flintstones.size

  e[counter2] = [flintstones[counter2], counter2]
  counter2 += 1
end

p e.to_h

# =end

# 2
ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10,
         'Marilyn' => 22, 'Spot' => 237 }
p ages.values.sum

ages_total = []

ages.each_with_index do |key_value, index|
      ages_total << key_value[1]
end

p ages_total.sum

ages_each_total = []

ages.each do |key, value|
  ages_each_total << value
end

p ages_each_total.sum

ages_arr = ages.to_a.flatten

counter = 0
index = 0

loop do
  break if index == ages_arr.size

  if ages_arr[index].class == Integer
    counter += ages_arr[index]
  end

  index += 1
end

p counter

total_ages = 0

ages.each do |_, age|
  total_ages += age
end

p total_ages

# 3

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10,
         'Marilyn' => 22, 'Spot' => 237 }

under_100 = ages.delete_if {|key, value| value >= 100}

p under_100

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10,
         'Marilyn' => 22, 'Spot' => 237 }

under_100_2 = ages.each_with_object ({}) do |(key,value), index|
  if value < 100
    index[key] = value
  end
end

p under_100_2

ages_arr = ages.to_a

under_100_3 = []

counter = 0

loop do
  break if counter == ages_arr.size

  if ages_arr[counter][1] < 100
    under_100_3 << ages_arr[counter]
  end

  counter += 1
end

p under_100_3.to_h

p ages.keep_if {|key, value| value < 100}
p ages.select {|key, value| value < 100}

# 4

ages = { 'Herman' => 32, 'Lily' => 30, 'Grandpa' => 5843, 'Eddie' => 10, 'Marilyn' => 22, 'Spot' => 237 }

min = ages.values[0]

ages.select {|_, value| if value < min then min = value end }

p min

ages_min = {}

ages_min[ages.keys[ages.values.index(ages.values.min)]] = ages.values.min

p ages_min

counter = 0

min_age = ages.values[counter]

loop do
  break if counter == ages.values.size

  if ages.values[counter] < min_age
    min_age = ages.values[counter]
  end

  counter += 1
end

p min_age

# 5

flintstones  = %w(Fred Barnet Wilma Betty BamBam Pebbles)

arr = []

flintstones.any? do |name|
  arr << name
  name[0,2] == 'Be'
end

p arr.index(arr.last)

a = flintstones.index do |name|
  name[0,2] == 'Be'
end

p a

counter = 0

loop do
  break if flintstones[counter][0,2] == 'Be'

  counter += 1
end

p counter

# 6

flintstones  = %w(Fred Barnet Wilma Betty BamBam Pebbles)

flintstones.each do |name|
  name.slice!(3..-1)
end

p flintstones

flintstones  = %w(Fred Barnet Wilma Betty BamBam Pebbles)

counter = 0

loop do
  break if counter == flintstones.size

  flintstones[counter] = flintstones[counter][0,3]
  counter += 1
end

p flintstones

flintstones  = %w(Fred Barnet Wilma Betty BamBam Pebbles)

flintstones.map! {|name| name = name[0..2]}

p flintstones

# 7

statement = 'The Flintstones Rock'
statement_arr = []
counter = 0

loop do
  break if counter == statement.size

  statement_arr << statement[counter]

  counter += 1
end
statement_arr.delete(' ')
statement_arr_counts = []
counter2 = 0

loop do
  break if counter2 == statement_arr.size

  counts = [statement_arr[counter2], statement_arr.count(statement_arr[counter2])]
  statement_arr_counts << counts
  statement_arr_counts.uniq!

  counter2 += 1
end

p statement_arr_counts.to_h

arr2 = statement.split('')

arr2.delete(' ')
counted = {}

arr2.each do |letter|
  counted[letter] = arr2.count(letter)
end

p counted

# 8

numbers = [1, 2, 3, 4, 5, 6, 7, 8]
numbers.each do |number|
  p number
  numbers.shift(2)
end

p numbers

# 9

words = 'the flintstones rock'

words_arr = words.split

words_arr.each do |word|
  word.capitalize!
end

p words_arr.join(' ')

words2 = 'the flintstones rock'

p words2.split.map {|word| word.capitalize}

p words2

# 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

count = 0

loop do
  break if count == munsters.keys.size

  member_stats = munsters.values[count]
  if (0..17).cover? member_stats.values[0]
    member_stats['age_group'] = 'kid'
  elsif (18..64).cover? member_stats.values[0]
    member_stats['age_group'] = 'adult'
  else
    member_stats['age_group'] = 'senior'
  end

  count += 1
end

munsters.each do |name, stats|
  case stats["age"]
  when 0..17
    stats['freak_type'] = 'blood sucker'
  when 18..64
    stats['freak_type'] = 'rampager'
  else
    stats['freak_type'] = 'evil genius'
  end
end

p munsters

hsh = {a: 100, b: 200, c: 300, a: 400}
p hsh

# Practice Problems: Sorting Nested Collections and Working with Blocks

# 1

arr = ['10', '11', '9', '7', '8']

p arr.sort {|a,b| b.to_i <=> a.to_i}

# 2

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p (books.sort_by do |year|
  p year[:published].to_i
end)

# 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

p hsh2[:third].keys[0]

# 4

arr1 = [1, [2, 3], 4]

arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}

hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

hsh2[['a']][:a][2] = 4
p hsh2

# 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_ages_total = []

munsters.values.each do |gender|
  if gender['gender'] == 'male'
    male_ages_total << gender['age']
  end
end

p male_ages_total
p male_ages_total.sum

# 6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  puts "#{key} is a #{value['age']}-year-old #{value['gender']}."
end

# 7

a #=> 2

b #=> [3,8]

# 8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |string|
    string.chars.each do |letter|
      puts letter if letter.match(/[aeiou]/)
    end
  end
end

# 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr1 = (arr.map do |sub|
          sub.sort do |a,b|
            b <=> a
          end
        end)

p arr1

# 10
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

indexed = arr.map do |index|
            index.each do |key, value|
              index[key] = value + 1
            end
          end

p indexed

# 11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p (arr.map do |threes|
  threes.reject {|num| num % 3 != 0}
end)

# 12

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hsh = {}

arr.each do |sub|
  hsh[sub[0]] = sub[1]
end

p hsh

# 13

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9] ]
# expected return value: [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

p (arr.sort_by do |n|
    n.select do |ele|
      ele.odd?
    end
  end)

# 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

p (hsh.map do |_,flora|
  if flora[:type] == 'fruit'
    flora[:colors].map {|color| color.capitalize}
  else
    flora[:size].upcase
  end
end)

# 15

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

p (arr.select do |hsh|
  hsh.values.flatten.all? do |num|
    num.even?
  end
end)

# 16

LETTERS = %w(a b c d e f)
NUMBERS = %w(0 1 2 3 4 5 6 7 8 9)

def uuid

  def eight_hexi
    counter = 0
    eight = []

    loop do
      hexidecimal = [LETTERS.sample, NUMBERS.sample]
      break if counter == 8
      eight << hexidecimal.sample
      counter += 1
    end
    eight.join
  end

  def four_hexi
    counter = 0
    four = []

    loop do
      hexidecimal = [LETTERS.sample, NUMBERS.sample]
      break if counter == 4
      four << hexidecimal.sample
      counter += 1
    end
    four.join
  end

  def twelve_hexi
    counter = 0
    twelve = []

    loop do
      hexidecimal = [LETTERS.sample, NUMBERS.sample]
      break if counter == 12
      twelve << hexidecimal.sample
      counter += 1
    end
    twelve.join
  end

  uuid = "#{eight_hexi}-#{four_hexi}-#{four_hexi}-#{four_hexi}-#{twelve_hexi}"
end

puts uuid

todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]

customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

fulfilled_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value] if order[:order_fulfilled]
  end

  fulfilled_orders[index][:order_value] = order_value
end

# all_orders =[
  # {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
  # {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
  # # rest of data
# ]

# fulfilled_orders =[
  # {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  # {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # # rest of data
# ]

p fulfilled_orders

def repeat(string, num)
  num.times do |_|
    puts string
  end
end

repeat('Hello', 3)

def print_in_box(string)
  dash = ''
  space = ''
  string.size.times {dash << '-'; space << ' '}
  puts '+-' + dash + '-+'
  puts '| ' + space + ' |'
  puts '| ' + string + ' |'
  puts '| ' + space + ' |'
  puts '+-' + dash + '-+'
end

print_in_box('slkjflkj')
print_in_box('')

def is_odd?(num)
  num % 2 == 0 ? false : true
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

def digit_list(num)
  num.to_s.split('').map { |str| str.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

def how_old_is_teddy
  puts "Teddy is #{rand(20..200)} years old!"
end

how_old_is_teddy

def instruction
  "Please write a word or multiple words:"
end

def word_get
  word = gets.chomp
  word
end

def size_output(word, characters_num)
  "There are #{characters_num} characters in \"#{word}\"."
end

print instruction, ' '

words = word_get
words_size = words.split.join.size

puts size_output(words, words_size)

STR_NUM = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(string)
  num = 0
  exponent = string.size - 1
  num_string = string.split('')
  loop do
    STR_NUM.each do |k,v|
      num += (10 ** exponent) * v if k == num_string.first
    end
    exponent -= 1
    num_string.shift
    break if num_string[0] == nil
  end
  num *= -1 if string[0] == '-'
  num
end

p string_to_integer('-1234')
p string_to_integer('1034')
p string_to_integer('01034')
p string_to_integer('10340')

odd = [1,3,4,5,6,7,8].each_with_object([]) do |value, array|
  if k.odd?
    array[k] = v
  elsif k.even?
    array[k] = v
  end
end

p odd

1 [['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
2   sub_arr.map do |letter|
3    letter.upcase
4  end
5 end
##
The outer array on line 1 calls Array#map. Lines 1 - 5 execute a block and its
return value is used by Array#map on line 1 to return a new outer array on line
1. The block variable #sub_arr on line 2 intialized on line 1 calls Array#map
on each index of the outer array. Lines 2 - 4 execute a block and its return
value is used by Array#map on line 2 to return a new array to the outer block.
On line 3 the block variable #letter initialized on line 2 calls the
String#upcase method returns a modified string value to the inner block execution
on lines 2 - 4.

#
On line 1 we initiate the local variable #greeting that points to string object
with the value 'Hello'. Lines 3 - 6 invoke a do..end loop. Line 4 reassigns the
local variable #greeting to a string object with the value 'Hi'. Line 5 uses
the keyword #break to exit the loop. Line 8 calls the puts method and passes in
the local variable #greeting as an argument. This outputs the string 'Hi' and
returns #nil.

This code snipet demonstrates local variable scope and accessability for
do..end blocks. Specifically, blocks have access to variables
at their internal scope that are initiated at an outer scope.

Lines 1 - 3 define a method called #a_method. Line 2 invokes the #puts method
and the string literal "hello world" is passed in as an argument.

When #a_method is invoked the string "hello world" will be output and return
nil.

Method Definition and Method Invocation

A named method can be defined in Ruby using the key word pair #def..end. The
name of the method immediately follows the key word #def. The constuction of the
method can also have parameters that will be arguments passed into the method
at invocation of the method. These parameters are set when they follow the name
of the method at definition.
e.g.,

def method_1 (parameter_1, parameter_2)
  expressions
end

To invoke this method we would reference its name along with two objects to be
passed in as arguments. We could also invoke a method along with a block. To do
this we would use #{..} or the key word pair #do..end.

Method definition sets how method invocation creates inner scope for the use of
local variables through the parameters of the method. A block's return value use
at a method's inner scope is also determined at that method's definition.

What is object passing?

When a method with an argument is invoked, the argument is evaulated and
reduced to an object. An object is data stored at a unique physical memory
address in the computer. All most everything in Ruby is an object, so a
method's argument can be a local variable that points to an object, another
method, a string literal, etc. That object is then made available to the inner
scope of the method. This is called passing the object to the method or object
passing. Objects can call methods as well and a calling object can be though of
as an implied argument.

Broadly, the manner in which a software language passes objects typically can
fall into two different silos, pass-by-reference or pass-by-value. This is
determined by the evaluation stategey of the coding language in use.

Pass-by-reference evaluation uses a pointer (a hidden or seen variable) that
points the method to the argument's object. The variable's bound reference is
the path by which the method's argument is reduced to an object. This reference
results in a direct use of and/or mutative manipulation of that data's physical
memory location. 

However, pass-by-value evaluation creates a copy of the data's value of the
argument at a different physical location, i.e. a different object. The method
then works with the data at the new physical memory address. In a strict
pass-by-value language, this use of a copied object makes it impossible to
change the value of the original calling object or passed in argument.

Pass-By-Reference-Value (Pass-By-Value-Of-The-Reference)

So, what is the value of a reference? When we initialize two local variables
that point to the same object, it can be said that the value of each connection
established is the same though the variables have different names. This is
because the differing variables reduce to the same physical memory address. If
we reassign one of our variables to a different object that has the same data
value as the original object, then the value of the pointing reference of our
reassigned variable is now different even though the value of the objects that
both variables point to are the same. In essence, pass-by-reference-value is an
evaluation strategy of a method's reductive relationship between an argument
(or caller) and a physical memory address. 

Further, when an argument has been passed into a method and a variable is bound
to the object of the argument, the value of the original REFERENCE can not be
changed at the inner scope of the method. Thus the immutable value of the
reference and the mutative capacity of the inner scope of a method if the
object passed in is a mutable object.

=end
