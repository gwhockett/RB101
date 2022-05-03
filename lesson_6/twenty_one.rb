
require "pry"

def prompt(msg)
  puts "=> #{msg}"
end

def display_cards()
  puts "-----Dealer-----"
  puts "---#{dealt(card)}-|-#{dealt(card)}---"
  puts "***************"
  puts "***************"
  puts "------Player------"
  puts "---#{dealt(card)}-|-#{dealt(card)}---"
end

def initiate_deck
  suit = %w(Hearts Diamonds Spades Clubs)
  cards = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  deck = []
  suit.each do |num|
    cards.map do |card|
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

def not_ace_numeric_value(cards)
  value = 0
  if cards[0].to_i != 0
    value += cards[0].to_i
  elsif cards[0].to_i == 0 && cards[0] != "Ace"
    value += 10
  elsif cards[0] == "Ace"
    "Ace"
  end
end

def not_aces_total(cards)
  not_aces = []
  cards.select do |card|
    not_aces << card if card.is_a?(Integer)
  end
  not_aces.sum
end

def aces_total(cards, current_total)
  aces_amount = 0
  cards.each do |card|
    if current_total + aces_amount + 11 > 21 && card == "Ace"
      aces_amount += 1
    elsif card == "Ace"
      aces_amount += 11
    end
  end
  aces_amount
end

def hit_stay
  player_turn = ''
  loop do
    prompt "Enter 'h' to hit."
    prompt "Enter 's' to stay."
    player_turn = gets.chomp
    break if player_turn == 's' || player_turn == 'h'
    prompt "That's not a valid entry." if player_turn != 's' && 
                                          player_turn != 'h'
  end
  player_turn    
end

def busted?(amount)
  amount > 21 ? true : false
end

def deal!(cards, hand)
  hand << cards.pop
end

deck = initiate_deck.shuffle

player_hand = []
dealer_hand = []

2.times { |i| deal!(deck, player_hand); deal!(deck, dealer_hand) }

puts "Player"

# p player_hand_numeric

loop do
  p player_hand
  player_total = 0
  player_hand_numeric = (player_hand.map do |card|
    not_ace_numeric_value(card)
  end)
  player_total += not_aces_total(player_hand_numeric)
  player_total += aces_total(player_hand_numeric, player_total)
  puts "Player has #{player_total}"
  prompt "Player busted!" if busted?(player_total)
  break if busted?(player_total)
  break if player_total == 21
  player_move = hit_stay
  deal!(deck, player_hand) if player_move == 'h'
  break if player_move == 's'
end

puts "Dealer"

dealer_hand_numeric = (dealer_hand.map do |card|
  not_ace_numeric_value(card)
end)

p dealer_hand
p dealer_hand_numeric

dealer_total = 0

dealer_total += not_aces_total(dealer_hand_numeric)
dealer_total += aces_total(dealer_hand_numeric, dealer_total)

p dealer_total