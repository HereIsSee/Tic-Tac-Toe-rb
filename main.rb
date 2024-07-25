require_relative 'lib/board'

def player_move player_number, player_sign, board
  puts "Player #{player_number.to_s} make a move"
  board.print_board

  while true do
    position = gets.chomp.to_i
    if board.get(position) != ' '
      puts "Invalid move! Player #{player_number.to_s} make a move again!"
    else
      board.put(position, player_sign)
      break
    end
  end
  puts "Player #{player_number.to_s} wins!" if board.win?
  board
end


puts "Do you want to play Tic-Tac-Toe?(yes/no3)"
while gets.chomp == "yes" do
  board = Board.new

  number = 0

  until board.win? || board.stalemate? do
    num = number % 2
    num == 0 ? player_move(1, 'x', board) : player_move(2, 'o', board)

    puts "Nobody wins :( !" if board.stalemate?
    number+=1
  end


  puts "Play again?"
end