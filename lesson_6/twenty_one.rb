# def initiate_deck
#   suit = %w(H D S C)
#   cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)
#   deck = []
#   until cards.size == 0
#     suit.map do |card|
#       arr = []
#       arr << card
#       deck << arr
#     end
#     a = cards.shift
#     deck.each do |num|
#       num << a if num.size < 2
#     end
#   end
#   deck
# end

def initiate_deck
  suit = %w(H D S C)
  cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  deck = []
  cards.each do |num|
    suit.map do |card|
      arr = []
      arr << card
      deck << arr
    end
    deck.each do |type|
      type << num if type.size < 2
    end
  end
  deck
end

p initiate_deck
