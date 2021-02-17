#!/usr/bin/env ruby

puts 'welcome to tic toc toe game'
def new_player
  puts 'player one choose a symbol x or o ?'
  user_symbol = gets.chomp
  case user_symbol
  when 'x'
    fplayers = 'x'
    splayers = 'o'
  when 'o'
    fplayers = 'o'
    splayers = 'x'
  else
    puts 'wrong inputs try again'
    return new_player
  end

  puts "player one has the sign #{fplayers}"
  puts "player two has the sign #{splayers}"
  puts
end

board = %w[1 2 3 4 5 6 7 8 9]
def boardshap(board)
  puts "#{board[0]} | #{board[1]} | #{board[2]}"
  puts "#{board[3]} | #{board[4]} | #{board[5]}"
  puts "#{board[6]} | #{board[7]} | #{board[8]}"
end

def user_move(board, player_sign)
  move_counts = 1
  while move_counts <= 9
    puts 'Enter your move from 1 to 9'
    player_turn(player_sign)
    moveaction = get_inputs(board, player_sign)
    board[moveaction - 1] = player_sign
    move_counts += 1
    boardshap(board)
    player_sign = if player_sign == 'x'
                    'o'
                  else
                    'x'
                  end
  end
end

def player_turn(player_sign)
  if player_sign == 'o'
    puts 'your turn second player'
  else
    puts 'your turn first player'
  end
end

def get_inputs(board, player_sign)
  moveaction = gets.chomp.to_i
  if moveaction <= 9 && moveaction.positive?
    puts 'invaild inputs please enter number from 1 to 9!!!'
    user_move(board, player_sign)
  elsif board[moveaction - 1] == 'x' || board[moveaction - 1] == 'o'
    puts 'wrong move already selected!!!'
    user_move(board, player_sign)
  else
    moveaction
  end
end

def player_won(player_one_turn)
  puts 'Game ended!'
  if player_one_turn
    puts 'Player one won!'
  else
    puts 'Player two won!'
  end
end

def draw
  puts 'Game ended!'
  puts "It's a draw"
end


new_player
user_move(board, 'x')
