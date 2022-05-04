def prompt(msg)
  puts "=> #{msg}"
end


def display_dealer_cards(dealer)
  if dealer.size < 3
    dealer[0]
  else
    dealer
  end
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
    value = cards[0].to_i
  elsif cards[0].to_i == 0 && cards[0] != "Ace"
    value = 10
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

def hand_value_total(hand)
  total = 0
  hand_numeric = (hand.map do |card|
                  not_ace_numeric_value(card)
                  end)
  total += not_aces_total(hand_numeric)
  total += aces_total(hand_numeric, total)
end

def dealer_initial_hand_showing(cards)
  value = 0
  if cards[0][0].to_i != 0
    value = cards[0][0].to_i
  elsif cards[0][0].to_i == 0 && cards[0][0] != "Ace"
    value = 10
  elsif cards[0][0] == "Ace"
    value = 11
  end
end

def player_hit_stay
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

2.times { |_| deal!(deck, player_hand); deal!(deck, dealer_hand) }

puts "Player"

# p player_hand_numeric

def game_output(player, dealer, player_amount, dealer_amount)
  system clear
  p display_dealer_cards(dealer)
  puts "Dealer is showing #{dealer_initial_hand_showing(dealer)}" if dealer.size < 3
  p player
  puts <<~ GAME

  

loop do
  p player_hand
  p display_dealer_cards(dealer_hand)
  puts "Dealer is showing #{dealer_initial_hand_showing(dealer_hand)}"
  player_total = hand_value_total(player_hand)
  puts "Player has #{player_total}"
  prompt "Player busted!" if busted?(player_total)
  break if busted?(player_total) || player_total == 21
  player_move = player_hit_stay
  deal!(deck, player_hand) if player_move == 'h'
  break if player_move == 's'
end

puts "Dealer"
# p dealer_hand_numeric
loop do
  p display_dealer_cards(dealer_hand)
  puts "Dealer is showing #{dealer_initial_hand_showing(dealer_hand)}"
  dealer_total = hand_value_total(dealer_hand)
  puts "Dealer has #{dealer_total}"
  prompt "Dealer busted!" if busted?(dealer_total)
  break if busted?(dealer_total) || (17..21).include?(dealer_total)
  deal!(deck, dealer_hand) if dealer_total < 17
end