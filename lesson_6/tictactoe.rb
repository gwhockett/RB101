INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize/
# rubocop:disable Metrics/MethodLength
def display_board(brd, scr)
  system 'clear'
  puts "Tic Tac Toe"
  puts "Win five games to win the match!"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "  #{empty_id(brd, 1)}  |  #{empty_id(brd, 2)}  |  #{empty_id(brd, 3)}"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "  #{empty_id(brd, 4)}  |  #{empty_id(brd, 5)}  |  #{empty_id(brd, 6)}"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "  #{empty_id(brd, 7)}  |  #{empty_id(brd, 8)}  |  #{empty_id(brd, 9)}"
  puts ""
  puts "Player score: #{scr[:player]} | Computer score: #{scr[:computer]}"
  puts ""
end
# rubocop:enable Metrics/AbcSize/MethodLength
# rubocop:enable Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def empty_id(brd, num)
  if brd[num] == INITIAL_MARKER
    num
  else
    ' '
  end
end

def joinor(arr, separator= ', ', conjunction= 'or')
  return arr.last if arr.size == 1
  arr2 = arr - [arr.last]
  arr2.join(separator) + " #{conjunction} #{arr.last}"
end

def player_places_piece!(brd)
  square = ''
  if brd.values.count(INITIAL_MARKER) == 1
    return brd[empty_squares(brd).last] = PLAYER_MARKER
  end
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def square_strategy?(mkr, mks, q, r)
  mks.count(mkr) == q && mks.count(INITIAL_MARKER) == r
end

def defensive_square!(brd)
  WINNING_LINES.each do |line|
    marks = brd.values_at(*line)
    if square_strategy?(PLAYER_MARKER, marks, 2, 1)
      return brd[line[marks.index(INITIAL_MARKER)]] = COMPUTER_MARKER
    end
  end
  middle_square!(brd)
end

def middle_square!(brd)
  if brd[5] == INITIAL_MARKER
    return brd[5] = COMPUTER_MARKER
  end
  offensive_square!(brd)
end

def offensive_square!(brd)
  WINNING_LINES.each do |line|
    marks = brd.values_at(*line)
    if square_strategy?(COMPUTER_MARKER, marks, 1, 2)
      return brd[line[marks.index(INITIAL_MARKER)]] = COMPUTER_MARKER
    end
  end
  random_square!(brd)
end

def random_square!(brd)
  brd[empty_squares(brd).sample] = COMPUTER_MARKER
end

def computer_places_piece!(brd)
  WINNING_LINES.each do |line|
    marks = brd.values_at(*line)
    if square_strategy?(COMPUTER_MARKER, marks, 2, 1) # winning_square!
      return brd[line[marks.index(INITIAL_MARKER)]] = COMPUTER_MARKER
    end
  end
  defensive_square!(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def score_counter!(win, scr)
  if win == 'Player'
    scr[:player] += 1
  elsif win == 'Computer'
    scr[:computer] += 1
  end
end

def continue_game(won, brd)
  if won
    "#{detect_winner(brd)} won this game!"
  else
    "Tie game! No score."
  end
end

def whos_first
  turn = ''
  system 'clear'
  puts "Welcome to Tic Tac Toe!"
  loop do
    prompt "Who goes first?"
    prompt "Enter 'p' if Player or 'c' if Computer."
    prompt "Enter 'r' if you would like the computer to choose."
    turn = gets.chomp.downcase
    break if turn == 'p' || turn == 'c' || turn == 'r'
    prompt "That's not a valid choice."
  end
  comp_choice = ['c', 'p']
  turn = comp_choice.sample if turn == 'r'
  turn
end

def alternate_player(plyr)
  if plyr == 'p'
    plyr = 'c'
  elsif plyr == 'c'
    plyr = 'p'
  end
  plyr
end

def place_piece!(brd, plyr)
  if plyr == 'p'
    player_places_piece!(brd)
  elsif plyr == 'c'
    computer_places_piece!(brd)
  end
end

def match_winner(mtc_scr)
  puts "Player won the match!" if mtc_scr[:player] == 5
  puts "Computer won the match!" if mtc_scr[:computer] == 5
end

def score_five?(mtc_scr)
  if mtc_scr[:player] == 5
    true
  elsif mtc_scr[:computer] == 5
    true
  else
    nil
  end
end

first_player = whos_first

loop do
  match_score = { player: 0, computer: 0 }
  loop do
    board = initialize_board
    current_player = first_player
    loop do
      display_board(board, match_score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, match_score)

    prompt continue_game(someone_won?(board), board)
    prompt "Press 'Enter' to continue."
    gets.chomp

    score_counter!(detect_winner(board), match_score)
    display_board(board, match_score)
    match_winner(match_score)
    break if score_five?(match_score)
  end

  prompt "Play again?(y or n)"
  answer = gets.chomp
  if answer == 'y'
    first_player = whos_first
  end
  break unless answer.downcase.start_with?('y')
end

puts "Thanks for playing Tic Tac Toe!"
puts "Good-bye!"
