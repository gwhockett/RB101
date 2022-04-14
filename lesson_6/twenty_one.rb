SUIT = %w(H D S C)
CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def initiate_deck
  a = 0
  deck = []
  loop do
    SUIT.each do |card|
      arr = []
      arr << card
      deck << arr
    end
    deck.each do |num|
      num << CARDS[a] if num.size < 2
    end
    break if deck.size == 52
    a += 1
  end
  deck
end

p initiate_deck