=begin
Question 1
Every object in Ruby has access to a method called #object_id, which returns a
numberical value that uniquely identifies the object. This method can be used
to determine whether two varialbe are pointing to the same object.

Take a look at the following code and predict the output:

Line 5 and line 7 will output the same value. Line 6 will be different.
While "forty two" on line 1 and line 2 have the same value their physical
location is different, thus causing variable a and variable b to point to
different objects. Variable c points to the same object as variable a.

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

Question 2
Let's take a look at another example with a small difference in the code:

What will the following code output?
Lines 5, 6 and 7 will all have the same output. This is because integers always
have the same object id because they are immutable.

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

Question 3
Let's call a method, and pass both a string and an array as arguments and see
how even though they are treated in the same way by Ruby,the results can be
different.

Study the following code and state what will be displayed...and why:

"My string looks like this now: pumpkins"
The addition/assignment operator #+= returns a concatenated new string of its
callers "pumpkins" + "rutabaga" = "pumpkinsrutabaga".
#my_string is not modified by #tricky_method though it is passed to it
as an argument. It points to a new object within the scope of #tricky_method.
"My array looks like this now: ["pumpkins", "rutabaga"]
The shovel operator #<< is a mutating method and returns the original array
passed to #tricky_method mutated. Since #<< is mutating it changes the value of
the original object caller but that caller's object id remains the same. So the
value of #my_array at the outer scope has changed but not the object it points
to.

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

Question 5
Depending on a method to modify its arguments can be tricky:

How can we change this code to make to result easier to predict for the next
programmer to maintain? That is, the resulting method should not mutate either
argument, but #my_string should be set to 'pumpkinsrutabaga' and #my_array
should be set to #['pumpkins', 'rutabaga']

def tricky_method(string_param, array_param)
  string_param = string_param + "rutabaga"
  array_param = array_param + ["rutabaga"]

  return string_param, array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]

my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

Question 6
How could the following method be simplified without chagning its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid(color)
  case color
  when "blue", "green"
    true
  else
    false
  end
end

def color_valid(color)
  color == 'blue' || color == 'green'
end

p color_valid("blue")
p color_valid("green")
p color_valid("df")
=end
