# frozen_string_literal: true

# The Board class represents a tic-tac-toe game board,
# It includes methods for placing pieces,
# checking for a win, stalemate and printing the board.
class Board
  def initialize
    @board_array = Array.new(9) { ' ' }
  end

  def print_board
    puts '-------------'
    puts "| #{@board_array[0]} | #{@board_array[1]} | #{@board_array[2]} |"
    puts '-------------'
    puts "| #{@board_array[3]} | #{@board_array[4]} | #{@board_array[5]} |"
    puts '-------------'
    puts "| #{@board_array[6]} | #{@board_array[7]} | #{@board_array[8]} |"
    puts '-------------'
  end

  def put(position, marker)
    @board_array[position] = marker
    self
  end

  def get(position)
    @board_array[position]
  end

  def stalemate?
    return true if @board_array.all? { |value| value != ' ' }

    false
  end

  def win?
    check_condition1 || check_condition2 || check_condition3
  end

  private

  def check_condition1
    return true if @board_array[0] == @board_array[1] && @board_array[1] == @board_array[2] && @board_array[0] != ' '
    return true if @board_array[3] == @board_array[4] && @board_array[4] == @board_array[5] && @board_array[3] != ' '
    return true if @board_array[6] == @board_array[7] && @board_array[7] == @board_array[8] && @board_array[6] != ' '

    false
  end

  def check_condition2
    return true if @board_array[0] == @board_array[3] && @board_array[3] == @board_array[6] && @board_array[0] != ' '
    return true if @board_array[1] == @board_array[4] && @board_array[4] == @board_array[7] && @board_array[1] != ' '
    return true if @board_array[2] == @board_array[5] && @board_array[5] == @board_array[8] && @board_array[2] != ' '

    false
  end

  def check_condition3
    return true if @board_array[0] == @board_array[4] && @board_array[4] == @board_array[8] && @board_array[0] != ' '
    return true if @board_array[2] == @board_array[4] && @board_array[4] == @board_array[6] && @board_array[2] != ' '

    false
  end
end
