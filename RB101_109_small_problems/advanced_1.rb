=begin
ex. 1 Madlibs Revisited

File.foreach('mad_libs.txt') do |line|
  puts line % { adjective: %w(quick lazy sleepy ugly skinny verbose).sample,
                noun: %w(fox dog head leg box rat snail moon dragon).sample,
                verb: %w(jumps lifts bites licks breathes slaps stings).sample,
                adverb: %w(easily lazily excitedly happily stridently).sample }
end

ex. 2 Seeing Stars
=end
def stars(num)
  