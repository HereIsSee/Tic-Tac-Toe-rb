# frozen_string_literal: true

require_relative 'lib/board'

def player_move(player_number, player_sign, board)
  loop do
    position = gets.chomp.to_i
    if board.get(position) != ' '
      puts "Invalid move! Player #{player_number} make a move again!"
    else
      board.put(position, player_sign)
      break
    end
  end
end

puts 'Do you want to play Tic-Tac-Toe?(yes/no)'
while gets.chomp == 'yes'
  board = Board.new

  number = 0

  until board.win? || board.stalemate?
    num = number % 2
    puts "Player #{num + 1} make a move"
    board.print_board
    num.zero? ? player_move(1, 'x', board) : player_move(2, 'o', board)

    if board.win?
      puts "Player #{num} wins!"
      board.print_board
    end
    puts 'Nobody wins :( !' if board.stalemate?
    number += 1
  end

  puts 'Play again?'
end
