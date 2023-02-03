=begin
    sub_length = input[index, length] - > [ Position Increase,    Length Constant  ]
                                          [Dependent Iterator, Independent Iterator]
                                          [   Inner Block    ,      Outer Block    ]

                                          [0, 1] [1, 1] [2, 1] [3, 1] [4, 1]...One element length sub-arrays at increasing positions
                                          [0, 2] [1, 2] [2, 2] [3, 2] [4, 2]...Two element length sub-arrays at increasing positions
                                          [0, 3] [1, 3] [2, 3] [3, 3] [4, 3]...Three element length sub-arrays at increasing positions
                                          
                                          or

                                          [  Position Constant ,   Length Increase ]
                                          [Independent Iterator, Dependent Iterator]
                                          [      Outer Block   ,     Inner Block   ]

                                          [0, 1] [0, 2] [0, 3] [0, 4] [0, 5]...First index position with increasing sub-arrays lengths
                                          [1, 1] [1, 2] [1, 3] [1, 4] [1, 5]...Second index position with increasing sub-arrays lengths
                                          [2, 1] [2, 2] [2, 3] [2, 4] [2, 5]...Third index position with increasing sub-arrays lengths
                                          
                                          Two iterations - postional iteration of the input array and a
                                          sub array size at every positional iteration.
                                          
                                          Break if the current iteration
                                          sub array length value is smaller than the current iteration range.
=end
# These methods use #string[start, length] or #array[start, length]
def start_index_dependent_length_independent(indpt_step, dpt_step, pasd_obj) # string or array argument
  max_length = pasd_obj.length
  (1..max_length).step(indpt_step) do |length_indpt| # independent iterator / outer block
    (0...max_length).step(dpt_step) do |start_dpt| # dependent iterator / inner block
      break if pasd_obj[start_dpt, length_indpt].size < length_indpt
      p pasd_obj[start_dpt, length_indpt]
    end
  end
end

def start_index_independent_length_dependent(indpt_step, dpt_step, pasd_obj) # string or array argument
  max_length = pasd_obj.length
  (0...max_length).step(indpt_step) do |start_indpt| # independent iterator / outer block
    (1..max_length).step(dpt_step) do |length_dpt| # dependent iterator / inner block
      break if pasd_obj[start_indpt, length_dpt].size < length_dpt
      p pasd_obj[start_indpt, length_dpt]
    end
  end
end

=begin
    sub_range = input[index..range] - > [Dependent Iterator, Independent Iterator]
                                        [   Inner Block    ,      Outer Block    ]
                                        [ Position Increase,    Range Constant   ]

                                        [0..0] [1..1] [2..2] [3..3] [4..4]...One element range sub-array at an increasing position
                                        [0..1] [1..2] [2..3] [3..4] [4..5]...Two element range sub-array at an increasing position
                                        [0..2] [1..3] [2..4] [3..5] [4..6]...Three element range sub-array at an increasing position

                                        or

                                        [Independent Iterator, Dependent Iterator]
                                        [      Outer Block   ,     Inner Block   ]
                                        [  Position Constant ,   Range Increase  ]

                                        [0..0] [0..1] [0..2] [0..3] [0..4]...First index position with an increasing sub-array range
                                        [1..1] [1..2] [1..3] [1..4] [1..5]...Second index position with an increasing sub-array range
                                        [2..2] [2..3] [2..4] [2..5] [2..6]...Third index position with an increasing sub-array range
                                        Two iterations - Positional iteration and a range
                                        iteration.

                                        Break if sub array range value is smaller than the current iteration
                                        range value.
=end
def range_descriptor
  puts ''
  puts "As the index of the input array increases these are all the"
  puts "sub-arrays possible with a range of #{rng_constant}."
end

def start_index_dependent_range_independent(indpt_step, dpt_step, pasd_obj)
  max_range = pasd_obj.size
  (1..max_range).step(indpt_step) do |range_indpt| # independent iterator / outer block
    (0...max_range).step(dpt_step) do |start_dpt| # dependent iterator / inner block
      break if (pasd_obj[start_dpt, range_indpt].size < range_indpt)
      puts "input_object[#{start_dpt}..#{range_inpdt}] -> "\
        "#{pasd_obj [start_dpt, range_indpt]}"
    end
  end
end

def start_index_independent_range_dependent(indpt_step, dpt_step, pasd_obj)
  max_range = pasd_obj.size
  (0...max_range).step(indpt_step) do |start_indpt| # independent index iterator / outer block
    (1..max_range).step(dpt_step) do |range_dpt| # dependent range iterator / inner block
      puts "input_object[#{start_indpt}..#{range_dpt}] -> "\
        "#{pasd_obj [start_indpt, range_dpt]}"
    end
  end
end
length_constant_index_increasing(%w(a b c d e f g h i j))
puts "#####"
index_constant_length_increasing(%w(a b c d e f g h i j))

#rng_constant_idx_increasing(%w(a b c d e f g h i j))
#puts
#puts "A sub-array can be returned where the range excedes the input array."
#puts "However, I choose to return only the largest sub-arrays possible for a "
#puts "given range."
#puts "#####"
#idx_constant_range_increase(%w(a b c d e f g h i j))

