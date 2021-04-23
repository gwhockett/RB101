=begin
method that returns the sum of two integers
---
-ask for and save two numbers
-define a method that converts two numbers
  into an intergers and adds the integers together
  then prints the return value of the synthesized integers
-pass the saved numbers into the defined method
=end
puts "What two numbers do you want to add together?"
puts "The first number?"

num1 = gets.chomp

puts "and the second?"

num2 = gets.chomp

def addition(a,b)
  puts a.to_i + b.to_i
end

addition(num1,num2)

=begin
a method that takes an array of strings and
returns a string that is all those strings concatenated
---
- define a method that takes an array containing a
  series of strings and connects those strings into
  a single string then prints the return value of the
  new single string
- pass the string containing array into
  the defined method 
=end

apart = ['Hi,', 'how', 'are', 'you?']
a_part = nil
def strung(x)
  x.each do


=begin
a method that takes an array of integers and
returns a new array with every other element
---
- define a method that takes an array that contains integers
- extract every other element from that array
- add the extracted elements to a new array
- return the new array  
=end