=begin
ex. 1 Cute Angles

# DEGREE_SIGN = "\xC2\xB0"

def dms(num)
  minutes = ((num - num.to_i) / (1 / 60.0)).to_i
  seconds = (((num - num.to_i) / (1 / 3600.0)) - (minutes.to_i * 60)).to_i

  format(%(#{num.to_i}#{"\xC2\xB0"}%02d'%02d"), minutes, seconds)
end

puts dms(30) # %(30°00'00")
puts dms(76.73) # %(76°43'48")
puts dms(254.6) # %(254°36'00")
puts dms(93.034773) # %(93°02'05")
puts dms(0) # %(0°00'00")

ex. 2 Delete vowels

def remove_vowels(ary)
  ary.map do |ele|
    ele.delete('aeiouAEIOU')
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) # %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) # %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) # ['BC', '', 'XYZ']

ex. 3 Fibonacci Number Location By Length

def find_fibonacci_index_by_length(digits)
  fibonacci = [1, 1]

  loop do
    fibonacci << fibonacci[-1] + fibonacci[-2]
    break if fibonacci[-1].to_s.size >= digits
  end
  fibonacci.size
end

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847

ex. 4 Reversed Arrays (Part 1)

def reverse!(ary)
  temp_ary = []

  ary.each do |ele|
    temp_ary << ele
  end
  ary.map! do |ele|
    ele = temp_ary.pop
  end
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

ex. 5 Reversed Arrays (Part 2)

def reverse(ary)
  temp_ary = []

  ary.each do |ele|
    temp_ary << ele
  end
  ary.map do |ele|
    ele = temp_ary.pop
  end
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

ex. 6 Combining Arrays

def merge(ary1, ary2)
  ary1.concat(ary2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]

ex. 7 Halvsies

def halvsies(ary)
  [ary[0, ary.size - ary.size / 2], ary[ary.size - ary.size / 2, ary.size / 2]]
end

p halvsies([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]

ex. 8 Find the Duplicate

def find_dup(ary)
  ary.permutation(2) do |ele|
    return ele[1] if ele[0] == ele [1]
  end
end

p find_dup([1, 5, 3, 1]) #== 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) #== 73

ex. 9 Does My List Include This?

def include?(ary, ele)
  ary.each do |i|
    return true if ele == i
  end
  false
end

p include?([1,2,3,4,5], 3) #== true
p include?([1,2,3,4,5], 6) #== false
p include?([], 3) #== false
p include?([nil], nil) #== true
p include?([], nil) #== false

ex. 10 Right Triangles

def triangle(num)
  star = 1

  loop do
    triangle = ''
    break if star == num + 1
    space = num - star
    space.times do |_|
      triangle << ' '
    end
    star.times do |_|
      triangle << '*'
    end
    puts triangle
    star += 1
  end
end

triangle(9)
=end
