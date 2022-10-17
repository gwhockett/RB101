=begin
Practice Problem 1
Turn this array into a hash where the names are the keys and the values are the
positions in the array.

flintstones = [ "Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam" ]

p (flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end)

Practice Problem 2
Add up all of the ages from the Munsters family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
           "Marilyn" => 22, "Spot" => 237 }
p ages.values.sum
p ages.values.inject(:+)

Practice Problem 3
Remove people with age 100 and greater from the ages hash.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
           "Marilyn" => 22, "Spot" => 237 }
p ages.delete_if { |_, value| value >= 100 }
p ages.keep_if { |_, value| value < 100 }

Practice Problem 4
Pick out the minimum age from our current Munster family hash:

Here they are asking only for the minimum age value not the key-value pair.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
           "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

Practice Problem 5
Find the index of the first name that starts with "Be" in the following array.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.bsearch_index { |i| i.include?("Be") }
p flintstones.index { |name| name[0, 2] == "Be" }
p flintstones.index { |name| name[0, 3] == "Bet" }

Practice Problem 6
Amend the following array so that the names are all shortened to just the first
three characters:

Using the mutating map method is the best answer because they ask us to change
"this" array, not to return a new array.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name = name[0, 3] }

Practice Problem 7
Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flinstones Rock"
characters = {}

statement.delete(' ').chars.each do |letter|
  if characters.key?(letter)
    characters[letter] += 1
  else
    characters[letter] = 1
  end
end

p characters

Practice Problem 8
What happens when we modify an array while we are iterating over it? What would
be output by this code?

An unexpected result. The original calling array is being mutated as it is
being iterated over.
The first output is:
1
3
The second output is:
1
2

#each is iterating over the original array from a stale meta-data length of the
array's original size.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

Practice Problem 9
As we have seen previously we can use some built-in string methods to change
the case of a string. A notably missing method is something provided in Rails,
but not in Ruby itself...titleize. This method in Ruby on Rails creates a
string that has each word capitalized as it would be in a title. For example,
the string:

words = "the flintstones rock"
would be:
words = "The flintstones Rock"

Write your own version of the rails #titleize implementation.

words = "the flintstones rock"

p words = words.split.map { |word| word.capitalize }.join(' ')

Practice Problem 10
Given the #munsters hash below. Modify the hash such that each member of the
Munster family has an additional "age_group" key that has one of three values
descirbing the age group the family member is in (kid, adult, or senior). Your
solution should produce the hash below:

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

Note: a kid is in the age range 0-17, an adult is in the range 18-64 and a
senior is aged 65+.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, stats|
  case 
  when (0..17).include?(stats["age"])
    stats["age_group"] = "kid"
  when (18..64).include?(stats["age"])
    stats["age_group"] = "adult"
  when (65..).include?(stats["age"])
    stats["age_group"] = "senior"
  end
end

p munsters == { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
"Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
"Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
"Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
"Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

=end