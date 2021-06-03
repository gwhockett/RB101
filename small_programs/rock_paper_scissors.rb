VALIDS = %w(rock paper scissors)

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock')
end

def display_result(player_1, player_2)
  if win?(player_1, player_2)
    prompt("You won!")
  elsif win?(player_2, player_1)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

choice = ''

loop do
  loop do
    prompt("Choose one: #{VALIDS.join(', ')}")
    choice = gets.chomp

    if VALIDS.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALIDS.sample

  prompt("You chose #{choice}; Computer chose #{computer};")

  display_result(choice, computer)

  prompt("Do want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing, Good-bye!")
