require_relative "piece.rb"
require_relative "slidable.rb"
class Queen < Piece
    include Slideable

    def symbol
        "♛".colorize(color)
    end

    def moves_dirs
        horizontal_dirs + diagonal_dirs
    end
end