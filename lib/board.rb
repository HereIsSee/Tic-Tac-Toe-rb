class Board

  # attr_accessor :board_array

  def initialize
    @board_array = Array.new(9) { " " }
  end

  def print_board
    puts "-------------"
    puts "| #{@board_array[0]} | #{@board_array[1]} | #{@board_array[2]} |"
    puts "-------------"
    puts "| #{@board_array[3]} | #{@board_array[4]} | #{@board_array[5]} |"
    puts "-------------"
    puts "| #{@board_array[6]} | #{@board_array[7]} | #{@board_array[8]} |"
    puts "-------------"
  end

  def put position, marker
    @board_array[position] = marker
    self
  end
  def get position
    @board_array[position]
  end

  def win?
    return true if @board_array[0] == @board_array[1] && @board_array[1] == @board_array[2] && @board_array[0] != ' '
    return true if @board_array[3] == @board_array[4] && @board_array[4] == @board_array[5] && @board_array[3] != ' '
    return true if @board_array[6] == @board_array[7] && @board_array[7] == @board_array[8] && @board_array[6] != ' '
    return true if @board_array[0] == @board_array[3] && @board_array[3] == @board_array[6] && @board_array[0] != ' '
    return true if @board_array[1] == @board_array[4] && @board_array[4] == @board_array[7] && @board_array[1] != ' '
    return true if @board_array[2] == @board_array[5] && @board_array[5] == @board_array[8] && @board_array[2] != ' '
    return true if @board_array[0] == @board_array[4] && @board_array[4] == @board_array[8] && @board_array[0] != ' '
    return true if @board_array[2] == @board_array[4] && @board_array[4] == @board_array[6] && @board_array[2] != ' '
    false
  end

  def stalemate?
    return true if @board_array.all? { |value| value != " "}
    false
  end
end