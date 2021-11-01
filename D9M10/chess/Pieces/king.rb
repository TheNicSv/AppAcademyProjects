require_relative "piece.rb"
require_relative "stepable.rb"
class King < Piece
  include Stepable

  def symbol
    "♔".colorize(color)
  end

  def moves_dirs
    [[1, 0],
    [1, 1],
    [0, 1],
    [-1, 0],
    [-1, -1],
    [-1, 1],
    [0, -1],
    [1, -1]]
  end
end
