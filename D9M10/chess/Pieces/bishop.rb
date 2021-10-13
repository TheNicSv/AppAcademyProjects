require_relative "piece.rb"
require_relative "slidable.rb"
class Bishop < Piece
    include Slideable
    def symbol
        "♝".colorize(color)
    end

    def moves_dirs
        diagonal_dirs
    end
end