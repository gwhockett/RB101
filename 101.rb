=begin
To use a numeric class or range class method for iteration of an
indexed object, derive the size / length of the indexed object.

Two iterations - postional iteration of the input array and a
sub array size at every positional iteration.

Break if the current iteration sub array length value is smaller
than the current iteration range.
=end

=begin
[Independent Iterator, Dependent Iterator]
[     Start Index    ,       Length      ]

[0, 1] [0, 2] [0, 3] [0, 4] [0, 5] -> First index start with increasing element lengths.
[1, 1] [1, 2] [1, 3] [1, 4] [1, 5] -> Second index start with increasing element lengths.
[2, 1] [2, 2] [2, 3] [2, 4] [2, 5] -> Third index start with increasing element lengths.

[Independent Iterator..Dependent Iterator]
[      Lower Range   ..   Upper Range    ]

[0..0] [0..1] [0..2] [0..3] [0..4] -> First index start at an increasing range.
[1..1] [1..2] [1..3] [1..4] [1..5] -> Second index start at an increasing range.
[2..2] [2..3] [2..4] [2..5] [2..6] -> Third index start at an increasing range.

=end
def indpt_itr_start

end

def dpt_itr_length

end

#####

def indpt_itr_lower_range

end

def dpt_itr_upper_range

end

=begin
[Dependent Iterator, Independent Iterator]
[   Start Index    ,        Length       ]

[0, 1] [1, 1] [2, 1] [3, 1] [4, 1] -> One element length at an increasing start index.
[0, 2] [1, 2] [2, 2] [3, 2] [4, 2] -> Two element length at an increasing start index.
[0, 3] [1, 3] [2, 3] [3, 3] [4, 3] -> Three element length at an increasing start index.

[Dependent Iterator.. Independent Iterator]
[    Lower Range   ..      Upper Range    ]

[0..0] [1..1] [2..2] [3..3] [4..4] -> One element range at an increasing index.
[0..1] [1..2] [2..3] [3..4] [4..5] -> Two element range at an increasing index.
[0..2] [1..3] [2..4] [3..5] [4..6] -> Three element range at an increasing index.
=end

def indpt_itr_length(pasd_obj, indpt_step = 1, dpt_step = 1)
  max_length = pasd_obj.length
  (1..max_length).step(indpt_step) do |indpt_length|
    dpt_itr_start(pasd_obj, max_length, indpt_length, dpt_step)
  end
  puts "#####"
end

def dpt_itr_start(pasd_obj, max_length, indpt_length, dpt_step)
  (0...max_length).step(dpt_step) do |dpt_start|
    break if pasd_obj[dpt_start, indpt_length].length < indpt_length
    p pasd_obj[dpt_start, indpt_length]
  end
end

#####

def indpt_itr_upper_range(pasd_obj, indpt_step = 1, dpt_step = 1)
  max_range = pasd_obj.size - 1
  (0..max_range).step(indpt_step) do |indpt_upper|
    dpt_itr_lower_range(pasd_obj, max_range, indpt_upper, dpt_step)
  end
  puts "#####"
end

def dpt_itr_lower_range(pasd_obj, max_range, indpt_upper, dpt_step)
  (0..max_range).step(dpt_step) do |dpt_lower|
    upper_range = dpt_lower + indpt_upper
    break if pasd_obj[dpt_lower..upper_range].size == upper_range - dpt_lower
    p pasd_obj[dpt_lower..upper_range]
    upper_range = nil
  end
end

indpt_itr_length(%w(a b c d e f g h i j))
indpt_itr_upper_range(%w(a b c d e f g h i j))
# indpt_itr_length("abcdefghij")
# indpt_itr_upper_range("abcdefghij")

#####
=begin
def start_index_independent_length_dependent(indpt_step, dpt_step, pasd_obj) # string or array argument
  max_length = pasd_obj.length
  (0...max_length).step(indpt_step) do |start_idx_indpt| # independent iterator / outer block
    (1..max_length).step(dpt_step) do |length_dpt| # dependent iterator / inner block
      break if pasd_obj[start_idx_indpt, length_dpt].length < length_dpt
      p pasd_obj[start_idx_indpt, length_dpt]
    end
  end
  puts "#####"
end

def start_index_independent_range_dependent(indpt_step, dpt_step, pasd_obj)
  max_idx_range = pasd_obj.size - 1 #string or array
  (0..max_idx_range).step(indpt_step) do |start_range_indpt| # independent index iterator / outer block
    (start_range_indpt..max_idx_range).step(dpt_step) do |end_range_dpt| # dependent range iterator / inner block
      break if pasd_obj[start_range_indpt..end_range_dpt].size == 0
      p pasd_obj[start_range_indpt..end_range_dpt]
    end
  end
  puts "#####"
end

start_index_independent_length_dependent(1, 1, %w(a b c d e f g h i j))
start_index_independent_length_dependent(1, 1, "abcdefghij")

start_index_independent_range_dependent(1, 1, %w(a b c d e f g h i j))
start_index_independent_range_dependent(1, 1, "abcdefghij")
def start_index_dependent_range_independent(indpt_step, dpt_step, pasd_obj) # string or array argument
  max_idx_range = pasd_obj.size - 1
  (0..max_idx_range).step(indpt_step) do |end_range_indpt| # independent iterator / outer block
    (0..max_idx_range).step(dpt_step) do |start_range_dpt| # dependent iterator / inner block
      break if pasd_obj[start_range_dpt..end_range_indpt].size == 0
      p pasd_obj[start_range_dpt..end_range_indpt]
    end
  end
  puts "#####"
end
versus
 def start_index_independent_range_dependent(indpt_step, dpt_step, pasd_obj)
   max_idx_range = pasd_obj.size - 1 #string or array
   (0..max_idx_range).step(indpt_step) do |start_range_indpt| # independent index iterator / outer block
     (0..max_idx_range).step(dpt_step) do |end_range_dpt| # dependent range iterator / inner block
       break if pasd_obj[start_range_indpt..end_range_dpt].size == 0
       p pasd_obj[start_range_indpt..end_range_dpt]
     end
   end
   puts "#####"
 end
def start_index_dependent_length_independent(indpt_step, dpt_step, pasd_obj) # passed object: string or array
  max_length = pasd_obj.length
  (1..max_length).step(indpt_step) do |length_indpt| # independent iterator / outer block
    (0...max_length).step(dpt_step) do |start_idx_dpt| # dependent iterator / inner block
      break if pasd_obj[start_idx_dpt, length_indpt].length < length_indpt
      p pasd_obj[start_idx_dpt, length_indpt]
    end
  end
  puts "#####"
end

def start_index_dependent_range_independent(indpt_step, dpt_step, pasd_obj) # string or array argument
  max_idx_range = pasd_obj.size - 1
  (0..max_idx_range).step(indpt_step) do |end_range_indpt| # independent iterator / outer block
    (0..max_idx_range).step(dpt_step) do |start_range_dpt| # dependent iterator / inner block
      result = pasd_obj[start_range_dpt..start_range_dpt + end_range_indpt]
      current_size = (start_range_dpt + end_range_indpt + 1) - start_range_dpt
      break if result.size < current_size
      p result
    end
  end
  puts "#####"
end

start_index_dependent_length_independent(2, 2, "abcdefghij")
start_index_dependent_range_independent(2, 1, %w(a b c d e f g h i j))
start_index_dependent_range_independent(1, 1, "abcdefghij")

def range_descriptor
  puts ''
  puts "As the index of the input array increases these are all the"
  puts "sub-arrays possible with a range of #{rng_constant}."
  ###
  puts "input_object[#{start_dpt}..#{range_inpdt}] -> "\
       "#{pasd_obj [start_dpt..range_indpt]}"
  ####
  puts "input_object[#{start_indpt}..#{range_dpt}] -> "\
       "#{pasd_obj [start_indpt...range_dpt]}"
  #puts "A sub-array can be returned where the range excedes the input array."
  #puts "However, I choose to return only the largest sub-arrays possible for a "
  #puts "given range."

end
=end