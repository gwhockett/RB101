=begin

ex. 1

File::path => :: class method
File#path => # instance method

ex. 2

optional arguments
documentation for the date class can found in the standard library api. look up
the civil method documentation there. Optional arguments are arguments that
are not required to be defined by the user.


ex. 3

default arguments in the middle - ruby docs - syntax, Files , column on the
left side, calling methods.rdoc. default positional arguments have an order
that does not change but each argument's value can be modified.

ex. 4

# bsearch instance method

a = [1, 4, 8, 11, 15, 19]
p a.bsearch { |i| i > 8 }
p a.bsearch_index { |i| i > 8 }

ex. 5

a = %w(a b c d e)

puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

# puts a.fetch(7)
IndexError: index 7 outside of array bounds: -5...5

# puts a.fetch(7, 'beats me')
beats me

# puts a.fetch(7) { |index| index**2 }
49

ex. 6

5.step(to: 10, by: 3) { |value| puts value }

# => 5
# => 8

# 5 is output as the first step. 8 is the next step. 10 is the limit but is not
# output because it is smaller than the defined step of 3 from 8.

ex. 7

s = 'abc'
puts s.public_methods(false).inspect

# In ruby documentation - String - Parent is Object - instance method public_methods

ex.8

a = [5, 9, 3, 11]
puts a.min(2).inspect

ex. 9

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# https://ruby-doc.org/stdlib/libdoc/psych/rdoc/Psych.html

=end