=begin
ex. 1 Madlibs Revisited

File.foreach('mad_libs.txt') do |line|
  puts line % { adjective: %w(quick lazy sleepy ugly skinny verbose).sample,
                noun: %w(fox dog head leg box rat snail moon dragon).sample,
                verb: %w(jumps lifts bites licks breathes slaps stings).sample,
                adverb: %w(easily lazily excitedly happily stridently).sample }
end

ex. 2 Seeing Stars
# define a method that takes an odd integer argument (n) that is greater than 6
# and outputs an 8 pointed star made of '*' on an (n) x (n) grid. All lines are
# made of white space charaters and three '*' that total (n). The middle line
# is made of (n) '*' with no white space. All other lines have a '*' at the
# middle position of the line. The top and bottom line have a '*' at the outer
# most position with the remainder positions taken by white space. The lines
# between the top line and the middle line progressivly step the outer '*' one
# space towards the center. The same from the bottom line to the middle. The
# line immediately above and below the middle line have all three '*' at the
# middle three positions with no white space between the '*'.

# How will the number of lines be determined?
# How will the spaces and '*' placed on each line?

def inner_spaces(num)
  inner = []

    (1..(num-3) / 2).to_a.reverse.each do |i|
      inner << (' ' * i)
    end
    (1..(num-3) / 2).to_a.each do |i|
      inner << (' ' * i)
    end

  inner
end

def outer_spaces(num)
  outer = []

    (0..(num-3) / 2).to_a.each do |i|
      outer << (' ' * i)
    end
    (0..(num-3) / 2).to_a.reverse.each do |i|
      outer << (' ' * i)
    end

  outer
end

def lines(num)
  outer = outer_spaces(num)
  inner = inner_spaces(num)
  lines = []

  (num / 2).times do |_|
    line = []
    line << outer.shift; line << '*'
    line << inner.shift; line << '*'
    line << inner.pop; line << '*'
    line << outer.pop
    lines << line
  end
  lines
end

def stars(num) 
  grid = lines(num)

  grid.each do |line|
    puts line.join
  end
  puts '*' * num
  grid.reverse_each do |line|
    puts line.join
  end
end

stars(99)

ex. Transpose 3x3

def transpose(ary)
  transited = [[], [], []]
  # i = 0
  
  # ary.each do |ele|
  #   ele.each_index do |num|
  #     transited[num][i] = ele[num]
  #   end
  #   i += 1
  # end
  i = 0

  loop do
    r = 0
    loop do
      transited[i][r] = ary[r][i]
      break if r + 1 == ary[r].size
      r += 1
    end
    break if i + 1 == ary.size
    i += 1
  end

  transited
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

ex. 4 Transpose MxN

def largest(ary)
  largest = 0
  transposition = []

  ary.each do |ele|
    largest = ele.size if ele.size > largest
  end
  largest.times { |_| transposition << [] }
  transposition
end

def transpose(ary)
  i = 0
  transpose = largest(ary)

  ary.each do |ele|
    ele.each_index do |num|
      transpose[num][i] = ele[num]
    end
    i += 1
  end
  transpose
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
p transpose([[3, 4, 1], [9, 7, 5]])

ex. 5 Rotating Matrices

def largest(ary)
  largest = 0
  transposition = []

  ary.each do |ele|
    largest = ele.size if ele.size > largest
  end
  largest.times { |_| transposition << [] }
  transposition
end

def transpose(ary)
  i = 0
  transpose = largest(ary)

  ary.each do |ele|
    ele.each_index do |num|
      transpose[num][i] = ele[num]
    end
    i += 1
  end
  transpose
end

def rotate90(ary)
  transpose(ary).map(&:reverse)
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

ex. 6 Find the bug

def my_method(array)
  if array.empty?
    []
  elsif array.size >= 2 # added "array.size >= 2" to give the desired return
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# On line 209 the control expression "elsif" did not have a condition to test
# on line 209. This left that control expression open to test lines 210 - 212.
# When map being called on array does return a truthy value the elsif
# conditional test does not have a specified return value. This lack of return
# value fractions in nil being returned. If "array.size >= 2" is added to line
# 209, then the map do-end block called by array would be returned when the
# condition of array.size >= 2 is true.

ex. 7 Merge Sorted Lists

def build(larger, smaller)  
  fraction = []
  l_index = 0
  s_index = 0

  while smaller[s_index] != nil
    if larger[l_index] < smaller[s_index]
      fraction << larger[l_index]; l_index += 1
    else
      fraction << smaller[s_index]; s_index += 1
    end
  end
  
  fraction + larger[l_index..-1]
end

def merge(ary_1, ary_2)
  if ary_1.size >= ary_2.size
    large, small = ary_1, ary_2
  else
    large, small = ary_2, ary_1
  end

  build(large, small)
end

p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) #== [1, 4, 5]
p merge([1, 4, 5], []) #== [1, 4, 5]

ex. 8 Merge Sort

def merge(l, s)  
  fraction = []
  l_index = 0
  s_index = 0

  while s[s_index] != nil && l[l_index] != nil
    if l[l_index] < s[s_index]
      fraction << l[l_index]; l_index += 1
    else
      fraction << s[s_index]; s_index += 1
    end
  end
  
  fraction + l[l_index..-1] + s[s_index..-1]
end

def merge_sort(ary)
  #binding.pry
  return ary if ary.size == 1

  front = merge_sort(ary[0...ary.size / 2])
  back = merge_sort(ary[ary.size / 2..-1])
  
  merge(front, back)
end

p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
p merge_sort([5, 3]) #== [3, 5]
p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) #== [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

ex. 9 Egyption Fractions 

def egyption_break_dance!(denom, egy, ary)
  loop do
    case
    when egy > 0
      ary << denom
    when egy < 0
      egy += Rational(1, denom)
    when egy == 0
      ary << denom
      break
    end
    denom += 1
    egy -= Rational(1, denom)
  end
end

def egyptian(fraction)
  denominator = 1
  denominators = []
  egyption = fraction - Rational(1, denominator)
  
  egyption_break_dance!(denominator, egyption, denominators)

  denominators
end

def unegyptian(ary)
  unegypt = []

  ary.each do |d|
    unegypt << Rational(1, d)
  end

  unegypt.sum
end

#p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
#p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
#p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
=end