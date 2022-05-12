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

def prompt(msg)
  puts "=> #{msg}"
end

def display_initial_dealer_hand(dealer)
  dealer[0] if dealer.size < 3
end

def dealer_initial_showing_amount(cards)
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

def player_turn_result(player_cards)
  player_score = hand_value_total(player_cards)
  if player_score == 21
    return 'stayed'
  elsif player_score > 21
    return 'Player busted!'
  end
  nil
end

def dealer_turn_result(dealer_cards)
  dealer_score = hand_value_total(dealer_cards)
  if (17..21).include?(dealer_score)
    return 'stayed'
  elsif dealer_score > 21
    return 'Dealer busted!'
  end
  nil
end

def deal!(cards, hand)
  hand << cards.pop
end

def player_turn_output(player_cards, dealer_cards)
  system 'clear'
  player_score = hand_value_total(player_cards)
  dealer_score = hand_value_total(dealer_cards)
  puts "Dealer hand [#{display_initial_dealer_hand(dealer_cards)}, [****, ****]]"
  display_initial_dealer_hand(dealer_cards)
  if dealer_cards.size < 3
    puts "Dealer is showing #{dealer_initial_showing_amount(dealer_cards)}"
  else
    puts dealer_score
  end
  puts ''
  puts "Player hand #{player_cards}"
  puts "Player has #{player_score}"
  puts ''
end

def dealer_turn_output(player_cards, dealer_cards)
  system 'clear'
  player_score = hand_value_total(player_cards)
  dealer_score = hand_value_total(dealer_cards)
  puts "Dealer hand #{dealer_cards}"
  puts "Dealer has #{dealer_score}"
  puts ''
  puts "Player hand #{player_cards}"
  puts "Player has #{player_score}"
end

  deck = initiate_deck.shuffle

  player_hand = []
  dealer_hand = []

  2.times { |_| deal!(deck, player_hand); deal!(deck, dealer_hand) }

  loop do
    # binding.pry
    player_turn_output(player_hand, dealer_hand)
    break if !!player_turn_result(player_hand)
    player_move = player_hit_stay
    break if player_move == 's'
    deal!(deck, player_hand) if player_move == 'h'
  end
  if busted?(hand_value_total(player_hand))
    prompt "Player busted! Dealer wins!"
  else
    loop do
      dealer_turn_output(player_hand, dealer_hand)
      break if dealer_turn_result(dealer_hand)
      deal!(deck, dealer_hand)
    end
  end
