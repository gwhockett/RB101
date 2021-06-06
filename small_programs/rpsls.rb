VALIDS = { '1': 'rock', '2': 'paper', '3': 'scissors',
           '4': 'lizard', '5': 'Spock' }

SELECTION = { you_won: ['rocklizard', 'rockscissors', 'scissorspaper',
                        'scissorslizard', 'paperrock', 'paperSpock',
                        'lizardSpock', 'lizardpaper', 'Spockscissors',
                        'Spockrock'],
              computer_won: ['lizardrock', 'scissorsrock', 'paperscissors',
                             'lizardscissors', 'rockpaper', 'Spockpaper',
                             'Spocklizard', 'paperlizard', 'scissorsSpock',
                             'rockSpock'] }

def prompt(message)
  puts("=> #{message}")
end

def win(first, second)
  if SELECTION[:you_won].include?(first + second)
    prompt("You win!")
  elsif SELECTION[:computer_won].include?(first + second)
    prompt("Computer won!")
  else
    prompt("It's a tie.")
  end
end

choice = ''
you_won = 0
computer_won = 0
answer = 'y'

loop do
  loop do
    prompt("Choose one:")
    puts ''
    VALIDS.each { |key, value| prompt("#{key} for #{value}") }

    choice = gets.chomp.to_sym

    if VALIDS.key?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALIDS.keys.sample

  puts ''

  prompt("You chose #{VALIDS[choice]}; Computer chose #{VALIDS[computer]};")

  win(VALIDS[choice], VALIDS[computer])

  puts ''

  if SELECTION[:you_won].include?(VALIDS[choice] + VALIDS[computer])
    you_won += 1
  elsif SELECTION[:computer_won].include?(VALIDS[choice] + VALIDS[computer])
    computer_won += 1
  end

  prompt("Your score: #{you_won}")
  prompt("Computer score: #{computer_won}")

  puts ''

  prompt("You are the Grand Winner!") if you_won == 3
  prompt("Computer is the Grand Winner!") if computer_won == 3

  if you_won == 3 || computer_won == 3
    puts ''
    prompt("Press enter to play again:")
    prompt("To quit enter 'n':")
    answer = gets.chomp
  end

  if (you_won == 3 || computer_won == 3) && (answer != 'n')
    you_won = 0
    computer_won = 0
    prompt("Scores reset!")
    puts ''
  end

  break prompt("Thanks for playing, Good-bye!") if answer.downcase == 'n'
end
