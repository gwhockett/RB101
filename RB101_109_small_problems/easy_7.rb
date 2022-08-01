=begin
ex. 1 Combine Two Lists

def interleave(ary1, ary2)
  combined = ary1.size + ary2.size
  leaved = []
  loop do
    leaved << ary1.shift
    leaved << ary2.shift
    break if leaved.size == combined
  end
  leaved
end

def interleave_zip(ary1, ary2)
  ary1.zip(ary2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) # [1, 'a', 2, 'b', 3, 'c']
p interleave_zip([1, 2, 3], ['a', 'b', 'c'])

ex. 2 Lettercase Counter

def letter_case_count(string)
  count = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |ele|
    if ele.start_with?(/[a-z]/)
      count[:lowercase] += 1
    elsif ele.start_with?(/[A-Z]/)
      count[:uppercase] += 1
    else
      count[:neither] += 1
    end
  end
  count
end

p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') #== { lowercase: 0, uppercase: 0, neither: 0 }

ex. 3 Capitalize Words

def word_cap(string)
  string.split(' ').map(&:capitalize).join(' ')
end

puts word_cap('four score and seven') #== 'Four Score And Seven'
puts word_cap('the javaScript language') #== 'The Javascript Language'
puts word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'

# The shorthand notation (# &:method_name) is the same as
# (# { |ele| ele.method_name }) and do..end blocks. This shorthand can be used as
# long as the method does have required arguments. 

ex. 4 Swap Case

def swapcase(string)
  string.chars.map do |ele|
    case
      when ele =~ /[A-Z]/ #=~ is a matching operator that strings against regular expressions
        ele.downcase
      when ele =~ /[a-z]/
        ele.upcase
      else
        ele
    end
  end.join
end

p swapcase('CamelCase') #== 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'

ex .5 Staggered Caps (Part 1)

def staggered_case(string)
  string.chars.each_index do |index|
    if index % 2 != 0
      string.chars[index] = string.chars[index].downcase
    else
      string.chars[index] = string.chars[index].upcase
    end
  end.join
end

p staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') #== 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'

ex. 6 Staggered_Caps (Part 2)

def staggered_case(string)
  alpha_position = true
  result = string.chars.each do |ele|
    if ele =~ /[a-zA-Z]/ && alpha_position == true 
      ele.upcase!
      alpha_position = !alpha_position
    elsif ele =~ /[a-zA-Z]/ && alpha_position == false
      ele.downcase!
      alpha_position = !alpha_position
    else
      ele
    end
  end
  result.join
end

p staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') #== 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 nUmBeRs'

ex. 7 Multiplicative Average

def show_multiplicative_average(ary)
  a = (ary.inject(:*) / ary.size.to_f)
  "The result is #{format('%.3f', a)}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

ex. 8 Multiply Lists

def multiply_list(ary1, ary2)
  ary1.map { |num| num = num * ary2[ary1.index(num)] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

ex. 9 Multiply All Pairs

def multiply_all_pairs(ary1, ary2)
  multiplied = []
  ary1.each do |num1|
    ary2.each do |num2|
      multiplied << num1 * num2
    end
  end
  multiplied.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

ex. 10 The End Is Near But Not Here

def penultimate(string)
  string.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
=end