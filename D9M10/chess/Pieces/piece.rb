require "colorize"

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    board.add_piece(self, @pos)
  end
  attr_reader :color, :board
  attr_accessor :pos

  def to_s #condition ? if_true : if_false
    " #{symbol} "
  end

  def symbol
    raise "symbol not defined"
  end

  def empty?
    false
  end

  def valid_moves
    moves.reject { |move| move_into_check?(move) }
  end

  def move_into_check?(end_pos) #maybe add a move_pice! metod
    dup = board.dup
    dup.move_piece!(pos, end_pos)
    dup.in_check?(color)
  end


end
