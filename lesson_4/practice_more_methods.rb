=begin
Practice Problem 1
What is the return value of the select method below?

The return value is [1, 2, 3]
The select method only considers the truthiness of the last executed expression
of the block. In this case it is the string 'hi', which has a truthy value.
This then allows the select method to return a new array that contains all of
elements of the original array.

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

Practice Problem 2
How does count treat the block's return value? How can we find out?

We can take a look at the documentation for the count method. In this case the
count only considers the truthiness of the block's return value. Here the block
returns a truthy value twice in turn the count returns an interger of 2. 

p (['ant', 'bat', 'caterpiller'].count do |str|
  str.length < 4
end)

Practice Problem 3
What is the return value of reject in the following code? Why?

Reject return a new array, in this instance [1, 2, 3]. Reject considers the
falsey return value of the block. Since puts is the last expression and has a
return value of nil to the block the block return falsey three times to reject.
Reject then returns the new array with all values of the original array. If the
block has a return value of truthy that object that was passed into the block
be excluded from the new array returned.

[1, 2, 3].reject do |num|
  puts num
end

Practice Problem 4
What is the return value of each_with_object in the following code? Why?
#each_with_object takes a method argument #({}) which is the collecetion object
and return object type for this method. The block takes two arugments. The 
first block argument is the current element of the calling array. The second
block arugument is represents the methods collection argument. The block
expression hash[value[0]] creates a key-value pair where the key is the first
index of the current string and set the value of that key to the string itself.
This key-value value pair is then placed in the collection object of the method,
a hash, and returned.

{'a' => 'any', 'b' => 'bear', 'c' => 'cat'}

p (['any', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end)

Practice Problem 5
What does shift do in the following code? How can we find out?
We could run the code in irb or look up the documentation for shift in the Hash
class. Here shift mutates the calling hash by removing the first key-value pair
and returning that pair as a new two element array.

hash = { a: 'ant', b: 'bear' }
hash.shift
#
Practice Problem 6
What is the return value of the following statement? Why?
The last object of the original calling array is 'caterpillar' that has a
character size of 11. The return value is the integer 11. The method
String#size is called by the Array#pop method who's return value is the last
object of the calling array for Array#pop.

['ant', 'bear', 'caterpillar'].pop.size

Practice Problem 7
What is the block's return value in the following code? How is it determined?
Also, what is the return value of #any? in this code and what does it output?
The block's return value is a boolean and considers the truthiness of the
block's last expression. In this case the last expression #odd? returns a
boolean value. The #any? method returns a true value and only the first
iteration of the array is output on its own line. Specifically 1 is
output. As soon as the block returns a truthy value to #any? The block is
terminated. Thus here only 1 is output.

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

Practice Problem 8
How does #take work? Is it destructive? How can we find out?
#take is called the array #arr. #take takes a method argument that is a
non-negative integer (n). #take then returns a new array containing #n elements
from the calling array. The orginal array is not mutated (non-destructive)

arr = [1, 2, 3, 4, 5]
arr.take(2)

Practice Problem 9
What is the return value of #map in the following code? Why?
#map returns a new array [nil, 'bear']. Since #map returns an array of the same
length as the original, here the original array of the values of the hash has
two elements. The first return value of the block is nil since 'any' does not
meet the conditional's parameter. 'bear' does meet the conditional's parameter,
thus 'bear' is included in the new array. 

p ({ a: 'ant', b: 'bear' }.map do |key, value|
     if value.size > 3
       value
     end
end)

Practice Problem 10
What is the return value of #map in the following code? Why?
The return value is [1, nil, nil]
#map returns a new array that is the same length of the orginal calling array.
The block's first return value is 1 and determined by the if/else conditional.
The last two iterations of the block return #nil.

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
=end