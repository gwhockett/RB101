VALIDS = { '1': 'rock', '2': 'paper', '3': 'scissors',
           '4': 'lizard', '5': 'Spock' }

SELECTION = { 'rocklizard': "You won!",
              'rockscissors': "You won!",
              'scissorspaper': "You won!",
              'scissorslizard': "You won!",
              'paperrock': "You won!",
              'paperSpock': "You won!",
              'lizardSpock': "You won!",
              'lizardpaper': "You won!",
              'Spockscissors': "You won!",
              'Spockrock': "You won!",
              'lizardrock': "Computer won!",
              'scissorsrock': "Computer won!",
              'paperscissors': "Computer won!",
              'lizardscissors': "Computer won!",
              'rockpaper': "Computer won!",
              'Spockpaper': "Computer won!",
              'Spocklizard': "Computer won!",
              'paperlizard': "Computer won!",
              'scissorsSpock': "Computer won!",
              'rockSpock': "Computer won!",
              'rockrock': "It's a tie!",
              'paperpaper': "It's a tie!",
              'scissorsscissors': "It's a tie!",
              'lizardlizard': "It's a tie!",
              'SpockSpock': "It's a tie!" }

=begin
you_won = ['rocklizard', 'rockscissors', 'scissorspaper', 'scissorslizard',
           'paperrock', 'paperSpock', 'lizardSpock', 'lizardpaper',
           'Spockscissors', 'Spockrock']
computer_won = ['lizardrock', 'scissorsrock', 'paperscissors', 'lizardscissors',
                'rockpaper', 'Spockpaper', 'Spocklizard', 'paperlizard',
                'scissorsSpock', 'rockSpock']
tie = ['rockrock', 'paperpaper', 'scissorsscissors',
       'lizardlizard', 'SpockSpock']
=end

def prompt(message)
  puts("=> #{message}")
end

def win(first, second)
  prompt(SELECTION[(first + second).to_sym])
end

choice = ''

loop do
  loop do
    prompt("Choose one:")
    VALIDS.each { |key, value| prompt("#{key} for #{value}") }

    choice = gets.chomp.to_sym

    if VALIDS.key?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer = VALIDS.keys.sample

  puts ""

  prompt("You chose #{VALIDS[choice]}; Computer chose #{VALIDS[computer]};")

  win(VALIDS[choice], VALIDS[computer])

  puts ""

  prompt("Press enter to play again:")
  prompt("To quit enter 'n':")
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

prompt("Thanks for playing, Good-bye!")
