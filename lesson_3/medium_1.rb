=begin
Question 1

p (10.times do |i|
  puts (' ' * i) + 'The Flintstones rock!'
end)

#On line 4 the integer 10 calls the method #times its return value is the
#caller integer 10.
#times executes a block at lines 4 - 6. This block iterates from 0 to 9 (10-1)
#and has return value of nil that is not used.
#On line 5 the multiplication operator is invoked a string object and the block
#variable 'i' which points to the current iteration of #times on line 4.
#Next, The addition operator is invoked on line 5. It takes the return value of
#the multiplication operator on line 5 and concatenates that value with string
#object 'The Flintstones rock!'
#On line 5 the #puts method is invoked and outputs the return value of addition
#operator on line 5.

Question 2
The following results will be an error.
Why is this and what are two possible ways to fix this?

The addition operator cannot combine two different object types. In this case the
object types are string and integer. 

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

Question 3
Alan wrote the following method, which was intended to show all of the factors
of the input number:

Alyssa noticed that it will fail if the input is 0, or a negative number, and
asked Alan to change the loop. How can you you make this work wihout using
#begin / end / until? Note that we're not looking to find the factors for 0 or
a negative number, but we just want to handle it gracefully instead of raising
an exception or going into an infinite loop.

#number % divisor == 0 ensures that only whole factors pushed into the factors
array.
#factors on line 11 is an explicit return value given that it is the last
expression of the method.

def factors(number)
  #return if number < 1
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(10)
p factors(0)

Question 4
Alyssa was asked to write an implementation of a rolling buffer. Elements are
added to the rolling buffer and if the buffer becomes full, then new elements
that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like #<< or #+
for modifying the buffer?". Is there a difference between to two, other than
what operator she chose to use to add an element to the buffer?

Option 1 uses the #<< (shovel) operator. This is a destructive/ mutating method.
This results in her first method returning the orginal array with updated values.
Option 2 uses the #+ (addition) operator. This creates a new array.
This results in her second method returning a new array while the orginal array
remains unchanged.

Both of her methods have the same return value.

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

Question 5
Alyssa asked Ben to write up a basic implementation of a Fiobonacci calculator.
A user passes in two numbers, and the calculator will keep computing the
sequence until some limit is reached. Ben coded up this impelementation but
complanied that as soon as he ran it, he got an error. Something about the
limit variable. What's wrong with the code?

This is a scoping error. The variable #limit is created at an outer scope of
the user method #fib but is not passed into that method. The # fib method then
attempts to reference #limit but #fib cannot because #fib does not have access
to the outer scope were #limit is initialized. To fix this, add another
parameter to the #fib method and pass it in or initialize limit at the inner
scope of #fib.

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

Question 6
What is the output of the following code?

The output is 34.

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

Question 7
One day Spot was playing with the Munster family's home computer and he wrote a
small program to mess with their demographic data:

After writing this method, he typed the following...and before Granpa could
stop him, he hit the Enter key with his tail:

Did the family's data get ransacked? Why or why not?

Yes. Spot's method uses indexed assigment which is a destructive method. This
means that the value of #munters is modified at the outer scope. The value of
#munsters is not what gets passed into the method but it is the object id that
gets passed in. The method then stores this object id internally in a locally
scoped variable.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

p munsters

Question 8
Method calls can take expressions as arguments. Suppose we define a method
called #rps as follows, which follows the classic rules of rock-paper-scissors
game: it returns the winning fist or, in the case of a tie, the fist that both
players played.

What is the result of the following call?

Start at the inner most scope #rps(rock, scissors) which returns #rock, then
the next scope is #rps((rock, paper), rock)) which returns #paper. Lastly,
the final scope of #rps(paper, rock) returns #paper.

=> paper

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

Question 9
Consider these two simple methods

What would be the return value of the following method invocation?

=> no

#foo always returns 'yes'
#bar always returns 'no' unless #param is equivalent to 'no',
only then will #bar return 'yes'.

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)
=end