def initiate_deck
  suit = %w(Hearts Diamonds Spades Clubs)
  cards = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  deck = []
  suit.each do |type|
    cards.each do |card|
      hash = {}
      hash[card] = type
      deck << hash
    end
  end
  deck
end

def not_ace_numeric_value(cards)
  card = cards.keys
  if card[0].to_i != 0
    card[0].to_i
  elsif card[0].to_i == 0 && !cards.key?("Ace")
    10
  elsif cards.key?("Ace")
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
  first_card = dealer_cards.first.keys[0]
  if first_card.to_i != 0
    first_card.to_i
  elsif first_card.to_i == 0 && first_card != "Ace"
    10
  elsif first_card == "Ace"
    11
  end
end

def player_hit_stay!(choice)
  loop do
    prompt "Enter 'h' to hit."
    prompt "Enter 's' to stay."
    choice[0] = gets.chomp.downcase
    if choice[0].start_with?('s', 'h')
      return choice[0]
    elsif !choice[0].start_with?('s', 'h')
      prompt "That's not a valid entry."
    end
  end
end

def player_turn_result(player_cards, player_choice)
  player_score = hand_value_total(player_cards)
  if player_score == 21
    'stay'
  elsif player_choice[0].start_with?('s')
    'stay'
  elsif player_score > 21
    'bust'
  end
end

def dealer_turn_result(dealer_cards)
  score = hand_value_total(dealer_cards)
  if (17..21).include?(score)
    'stay'
  elsif score > 21
    'bust'
  end
end

def deal!(cards, hand)
  hand << cards.pop
end

def prompt(msg)
  puts "=> #{msg}"
end

def intro_or_next_game(play_more)
  if play_more == true
    nil
  else
    system 'clear'
    puts '===================================================', ''
    puts 'Welcome to 21! Like classic Blackjack...'
    puts 'Don\'t go over 21 or you bust and the Dealer wins!'
    puts 'If you and the Dealer don\'t bust out'
    puts 'then the hand with the highest score wins.'
    puts 'Hit to get another card for your hand.'
    puts 'Stay to keep your score.', ''
    puts '===================================================', ''
    prompt 'Press \'Enter\' to start the game.'
    gets.chomp
  end
end

def play_again?
  puts ''
  puts "---------------------------------------------------", ''
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def hand_display(hand)
  arr = []
  hand.each do |cards|
    cards.each_pair do |key, value|
      arr << "#{key} of #{value}"
    end
  end
  arr
end

def player_turn_output(player_cards, dealer_cards)
  system 'clear'
  player_score = hand_value_total(player_cards)
  puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=", ''
  puts "Dealer's hand [\"#{hand_display(dealer_cards)[0]}\", \"*** of *****\"]"
  puts "Dealer is showing #{dealer_first_card_amount(dealer_cards)}", ''
  puts "Player's hand #{hand_display(player_cards)}"
  puts "Player has #{player_score}", ''
  puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=", ''
end

def player_stayed(player_cards)
  prompt "Player stayed with a score of #{hand_value_total(player_cards)}."
  puts ''
  prompt 'Press \'Enter\' to continue.'
  gets.chomp
  prompt "Dealer's turn..."
  sleep(1)
end

def dealer_stayed(dealer_cards)
  prompt "Dealer stayed with a score of #{hand_value_total(dealer_cards)}."
  puts ''
  sleep(1)
end

def dealer_turn_output(player_cards, dealer_cards)
  system 'clear'
  player_score = hand_value_total(player_cards)
  dealer_score = hand_value_total(dealer_cards)
  puts "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*", ''
  puts "Dealer's hand #{hand_display(dealer_cards)}"
  puts "Dealer has #{dealer_score}", ''
  puts "Player's hand #{hand_display(player_cards)}"
  puts "Player has #{player_score}", ''
  puts "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*", ''
end

def game_result_output(dealer_cards, player_cards, player_choice)
  dealer_score = hand_value_total(dealer_cards)
  player_score = hand_value_total(player_cards)

  if player_turn_result(player_cards, player_choice) == 'bust'
    'Player busted, Dealer wins!'
  elsif dealer_turn_result(dealer_cards) == 'bust'
    'Dealer busted, Player wins!'
  elsif player_score > dealer_score
    'Player wins!'
  elsif dealer_score > player_score
    'Dealer wins!'
  elsif dealer_score == player_score
    'Push, tie game.'
  end
end

def dealing_cards
  prompt "Dealing card(s)..."
  sleep(2)
end

next_game = nil
loop do
  intro_or_next_game(next_game)
  player_hand = []
  dealer_hand = []
  player_move = ['_']
  deck = initiate_deck.shuffle
  2.times do |_|
    deal!(deck, player_hand)
    deal!(deck, dealer_hand)
  end
  dealing_cards
  loop do
    player_turn_output(player_hand, dealer_hand)
    break if !!player_turn_result(player_hand, player_move)
    player_hit_stay!(player_move)
    deal!(deck, player_hand) if player_move[0].start_with?('h')
    dealing_cards if player_move[0].start_with?('h')
  end
  if player_turn_result(player_hand, player_move) == 'stay'
    player_stayed(player_hand)
    loop do
      dealer_turn_output(player_hand, dealer_hand)
      dealer_stayed(dealer_hand) if dealer_turn_result(dealer_hand) == 'stay'
      break if !!dealer_turn_result(dealer_hand)
      dealing_cards
      deal!(deck, dealer_hand)
    end
  end
  sleep(1)
  prompt game_result_output(dealer_hand, player_hand, player_move)
  next_game = play_again?
  break unless next_game == true
end
