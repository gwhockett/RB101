
require "pry"
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

def display_cards()
  puts "-----Dealer-----"
  puts "---#{dealt(card)}-|-#{dealt(card)}---"
  puts "***************"
  puts "***************"
  puts "------Player------"
  puts "---#{dealt(card)}-|-#{dealt(card)}---"
end

def prompt(msg)
  puts "=> #{msg}"
end

deck = initiate_deck.shuffle

def not_ace_numeric_value(card)
  value = 0
  if card[1].to_i != 0
    value += card[1].to_i
  elsif card[1].to_i == 0 && card[1] != "A"
    value += 10
  elsif card[1] == "A"
    "A"
  end
end

delt = []

delt << not_ace_numeric_value(deck.pop)
delt << not_ace_numeric_value(deck.pop)
delt << not_ace_numeric_value(deck.pop)
delt << not_ace_numeric_value(deck.pop)

p delt

total = 0

def not_aces_total(cards)
  not_aces = []
  cards.select do |card|
    not_aces << card if card.is_a?(Integer)
  end
  not_aces.sum
end

total += not_aces_total(delt)

def aces_total(cards, current_total)
  aces_amount = 0
  cards.each do |card|
    if current_total + 11 > 21 && card == "A"
      aces_amount += 1
    elsif card == "A"
      aces_amount += 11
    end
  end
  aces_amount
end

p aces_total(delt, total)
p total
p total += aces_total(delt, total)