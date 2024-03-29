=begin
Practice Problem 1
How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

p arr.sort { |a, b| b.to_i <=> a.to_i }

Practice Problem 2
How would you oder this array of hashes based on the year of publication of
each book, from the earliest to the lastest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p (books.sort_by do |a|
  a[:published].to_i
end)

Practice Problem 3
For each of these ojects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

arr1[2][1][3]
arr2[1][:third][0] #watch out! Only two indexes in the outer array
arr3[2][:third][0][0]
hsh1['b'][1]
p hsh2[:third].to_a[0][0] #hsh[:third]key(0) - Hash#key(n) returns the n "index" key of the hash 
Practice Problem 4
For each of these collection objects where the value 3 occurs, demonstrate how
you would change this to value 4.

arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4

Practice Problem 5
Given the following nested hash, figure out the total age of just the male
members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total = 0

munsters.each_value do |i|
  total += i['age'] if i['gender'] == 'male'
end

p total

Practice Problem 6
One of the most frequently used real-world string properties is that of "string
substitution", where we take a hard-coded string and modify it with various
parameters from our program.
From the previous hash, print out the name and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, stat|
  puts "#{name} is a #{stat['age']}-year-old #{stat['gender']}."
end

Practice Problem 7
Given this code, what would be the final values of #a and #b? Try to work this
out witout running the code. Pay attention to what the question is asking for
specifically!!!

a = 2
b = [5, 8]
arr = [a, b]
arr[0] += 2
arr[1][0] -= a

a # => 2
b # => [3, 8]
arr # => [4, [3, 8]]

Practice Problem 8
Using the #each method, write some code to output all of the vowels from the
strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, arr|
  arr.each do |word|
    word.chars.each do |ele|
      puts ele if /[aeiou]/ =~ ele
    end
  end
end

Practice Problem 9
Given this data structure, return a new array of the same structure but with
but with the sub arrays being ordered (alphabetrically or numerically as
appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p arr.map { |group| group.sort { |a, b| b <=> a } }

Practice Problem 10
Given the following data structure and witout modifying the original array, use
the #map method to return a new array indentical in structure to the original
but where the value of each integer is incremented by 1.

p ([{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  hsh.transform_values do |value|
    value + 1
  end
end)

Practice Problem 11
Given the following data structure use a combination of methods, including
either the #select or #reject method, to return a new array identical in
structure to the origninal but containing only the integers that are
multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p (arr.map do |group|
    group.select { |i| i if i % 3 == 0 }
  end)

Practice Problem 12
Given the following data structure, and without using the Array#to_h method,
write some code that will return a hash where the key is the first item in
each sub array and the value is the second item.
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}

arr.each do |group|
  hsh[group[0]] = group[1]
end

p hsh

Practice Problem 13
Given the following data structure, return a new array containing the same
sub-arrays as the original but ordered logically by only taking into
consideration the odd numbers they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

p arr.sort { |a, b| a.select { |i| i.odd? } <=> b.select { |i| i.odd? }}

Practice Problem 14
Given this data structure write some code to return an array containing the
colors of the fruits and the sizes of the vegetables. The sizes should be
uppercase and the colors should be capitalized.

#[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each do |_, stats|
  if stats[:type] == 'fruit'
    arr << stats[:colors].map { |ele| ele.capitalize }
  elsif stats[:type] == 'vegetable'
    arr << stats[:size].upcase
  end
end

p arr

Practice Problem 15
Given this data structure write some code to return an array which contains
only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_arr = []

arr.each do |hsh|
  numbers = []
  hsh.each do |_,group|
    numbers << group
  end
  if numbers.flatten.all? { |i| i.even? }
    even_arr << hsh
  end
end

p even_arr

Practice Problem 16
UUID 5 section 32 hexadecimal character 8-4-4-4-12 string
e.g., "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def glif(n)
  hexadecimal = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  str = ''
  n.times { |_| str << hexadecimal.sample }
  str
end

def generate_UUID
  "#{glif(8)}-#{glif(4)}-#{glif(4)}-#{glif(4)}-#{glif(12)}"
end

p generate_UUID
=end
