def reverse_sentence(sentence)
  sentence.scan(/\w+/).reverse.join(' ')
end

puts reverse_sentence('Hi my name is George')