require 'pry'

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

# hand value logic start

def not_ace_numeric_value(cards)
  if cards[0].to_i != 0
    cards[0].to_i
  elsif cards[0].to_i == 0 && cards[0] != "Ace"
    10
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
  total
end

def dealer_first_card_amount(dealer_cards)
  first_card = dealer_cards[0][0]
  if first_card.to_i != 0
    first_card.to_i
  elsif first_card.to_i == 0 && first_card != "Ace"
    10
  elsif first_card == "Ace"
    11
  end
end

# hand value logic end

# game play logic start

def player_hit_stay!(player_choice)
  loop do
    prompt "Enter 'h' to hit."
    prompt "Enter 's' to stay."
    player_choice[0] = gets.chomp
    return player_choice[0] if player_choice[0] == 's'
    return if player_choice[0] == 'h'
    prompt "That's not a valid entry." if player_choice[0] != 's' &&
                                          player_choice[0] != 'h'
  end
end

def player_turn_result(player_cards, dealer_cards, player_choice)
  player_score = hand_value_total(player_cards)
  dealer_score = hand_value_total(dealer_cards)
  if player_score == 21
    return 'stay'
  elsif player_choice[0] == 's'
    return 'stay'
  elsif player_score > 21 && dealer_score < 22
    return 'Dealer'
  end
  nil
end

def dealer_turn_result(player_cards, dealer_cards)
  dealer_score = hand_value_total(dealer_cards)
  player_score = hand_value_total(player_cards)
  if (17..21).include?(dealer_score)
    return 'stay'
  elsif dealer_score > 21 && player_score < 22
    return 'Player'
  end
  nil
end

def game_result(player_cards, dealer_cards, player_choice)
  dealer_score = hand_value_total(dealer_cards)
  player_score = hand_value_total(player_cards)
  if player_turn_result(player_cards, dealer_cards, player_choice) == 'Dealer'
    'Dealer'
  elsif dealer_turn_result(player_cards, dealer_cards) == 'Player'
    'Player'
  elsif dealer_score == player_score
    'Tie'
  end
end

def deal!(cards, hand)
  hand << cards.pop
end

# game play logic end

# game display logic start

def prompt(msg)
  puts "=> #{msg}"
end

def player_turn_output(player_cards, dealer_cards)
  system 'clear'
  player_score = hand_value_total(player_cards)
  puts "Dealer hand [#{dealer_cards[0]}, [***, *****]]"
  puts "Dealer is showing #{dealer_first_card_amount(dealer_cards)}", ''
  puts "Player hand #{player_cards}", "Player has #{player_score}", ''
end

def dealer_turn_output(player_cards, dealer_cards)
  system 'clear'
  player_score = hand_value_total(player_cards)
  dealer_score = hand_value_total(dealer_cards)
  puts "Dealer hand #{dealer_cards}", "Dealer has #{dealer_score}", ''
  puts "Player hand #{player_cards}", "Player has #{player_score}", ''
end

# game display logic end
loop do
  player_hand = []
  dealer_hand = []
  player_move = []
  deck = initiate_deck.shuffle
  2.times do |_|
    deal!(deck, player_hand)
    deal!(deck, dealer_hand)
  end
  loop do
    player_turn_output(player_hand, dealer_hand)
    break if !!player_turn_result(player_hand, dealer_hand, player_move)
    player_hit_stay!(player_move)
    deal!(deck, player_hand) if player_move[0] == 'h'
  end
  p player_move
  break if player_turn_result(player_hand, dealer_hand, player_move) == 'Dealer'
  loop do
    dealer_turn_output(player_hand, dealer_hand)
    break if !!dealer_turn_result(player_hand, dealer_hand)
    deal!(deck, dealer_hand)
  end
  break
end
