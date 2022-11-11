=begin
p true.class          # => TrueClass
p true.nil?           # => false
p true.to_s           # => "true"
p true.methods        # => list of methods you can call on the true object

p false.class         # => FalseClass
p false.nil?          # => false
p false.to_s          # => "false"
p false.methods       # => list of methods you can call on the false object

#Example 1

if true
  puts 'hi'
else
  puts 'goodbye'
end

#Example 2
if false
  puts 'hi'
else
  puts 'goodbye'
end

#Example 3
num = 5

if (num < 10)
  puts "small number"
else
  puts "large number"
end

p (num < 10).class

#Example 5
p true && true
p true && false
p num < 10 && num.odd?


#Truthiness
num = 5

if num
  puts "valid number"
else
  puts "error!"
end

=end