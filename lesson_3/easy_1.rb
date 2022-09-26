=begin
Question 1

1 numbers = [1, 2, 2, 3]
2 numbers.uniq
3
4 puts numbers

line 1 The variable 'numbers' is initialized pointing to the array object [1, 2, 2, 3]
line 2 'numbers' calls the method #uniq which returns a new array [1, 2, 3]
line 4 the #puts takes the 'numbers' variable as an argument and outputs the strings:
1
2
2
3

Question 2

Describe the difference between #! and #?in Ruby. And explain what would happen
in the following scenarios:

1. What is the #!= and where should you use it?
    This is the 'not equivalence' binary operator and returns a boolean true when two
    expressions are not equivalent in their return value. Vise-versa, when two
    expressions are equivalent in their return value, a boolena false is
    returned.
2. Put #! before something, like #!user_name
    This causes the truthiness of an expression to inverted.
3. Put #! after something, like words.uniq!
    This is a part of a method name that indicates a method is detructive / mutating.
4. Put #? before something.
    This not done in Ruby but #? and #: is the ternary operator
5. Put #? after something.
    This is part of a method name that returns a boolean value.
6. Put #!! before something, like !!user_name.
    This is called a 'double bang' and is used to convert a truthy return value
    into an explicitly boolean return value.

Question 3

Replace the word "important" with "urgent" in this string:
1. The variable 'advice' is initialized that poits to a string literal sentence.
2. That string literal needs to mutated so that 'important' is replaced with 'urgent'
    or a new string literal is created that fit the parameters of the problem.
3. All words in the string literal should isolated and cataloged so that they can be
    evaluated for their value.
4. Once the words have been evaluated the word 'important' can then be replaced with 'urgent'
5. Post replacment the words can be concatinated back into a sentence in their desired order.


advice = "Few things in life are as important as house training your pet dinosaur."

puts (advice.split.map do |i|
    if i == 'important'
      i = 'urgent'
    else
      i
    end
end.join(' '))

puts advice.gsub!('important', 'urgent')

Question 4

The Ruby Arry class has several methods for removing items from the array.
Two of them have very similar names. Lets's see how they differ:

What do the following method calls do (assume we reset #numbers to the original
array between method calls)?


numbers = [2, 3, 4, 5]
p numbers.delete(1)
p numbers

#delete_at is an instance method that is called by the variable #numbers.
It is taking a single argument that is an index of the array that #numbers
points to. #delete_at removes the object contained at that index from the
#numbers array and returns that object, in this case the integer 2.
#delete_at is mutating

#delete is a instance method that is called by the variable #numbers.
It is taking a single argument that may be an object contained in the array
that #numbers points to. #delete removes all object that are equivalent to
its parameter contained in its argument from the #numbers array and returns
that object, in this case the integer 1. It the calling array does 
contain that object, #delete returns nil. #delete is mutating

Question 5

Programmatically determine if 42 lies between 10 and 100.

p (10..100) === 42

p (10..100).include? 42

Question 6

Show two differnt ways to put the expected "Four score and " if of
'famous_words'.

famous_words = "seven years ago..."
first_famous = "Four score and "

puts famous_words.prepend(first_famous)
famous_words = "seven years ago..."
puts first_famous + famous_words
famous_words = "seven years ago..."
puts first_famous << famous_words
famous_words = "seven years ago..."
famous_words = (famous_words[0] = first_famous)
puts famous_words

Question 7

Un-nest the following

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten!

Question 8

Turn the following hash into an array that only contains Barney's name and
number.


flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p [flintstones.keys[2], flintstones.values[2]]
p flintstones.assoc("Barney")
p flintstones.rassoc(2)

=end