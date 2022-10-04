=begin
Question 1
What do you expect to happen when the #greeting variable is referenced in the
last line of the code below?

greeting will have a return value of nil and there won't be an "undefined
method or local variable" execption thrown. Typically, when you reference an
uninitialized variable, Ruby will raise an exception, stating that it's
unidefined. However, when you initialized a local variable within an #if block,
even if that #if block doesn't get executed, the local variable is initialized
to #nil.

if false
  greeting = "hello world"
end

p greeting

Question 2
What is the result of the last line in the code below?

Output will be: {:a=>"hi there"}

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

Question 3
In other practice problems, we have looked at how the scope of variables affect
the modification of one "layer" when they are passed to another.
to drive home the salient aspects of variable scope and modification of one
scope by another, consider the following similar sets of code.
What will be printed by each of these code groups?

a.  one is: one
    two is: two
    three is: three
b.  one is: one
    two is: two
    three is: three
c.  one is: two
    two is: three
    three is: one

# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

Question 4
Ben was tasked to write a simple ruby method to determine if an input string is
an IP address representing dot-sepatated number, e.g. "10.4.5.11". He is not
familiar with regular expressions. Alyssa supplied Ben with a method called
#is_an_ip_number? that determines if a string is a numeric string between 0 and
255 as required for IP numbers and asked Ben to use it.

Alyssa revieweed Ben's code and says "It's a good start, but you missed a few
things. You're not returning a false condition, and you're not handling the
case that there are more or fewer than 4 components to the IP address:
e.g. "4.5.5" or "1.2.3.4.5" should be invalid."

Help Ben fix this code.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
    return true
  else
    false
  end
end

=end