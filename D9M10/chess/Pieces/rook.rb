require_relative "piece.rb"
require_relative "slidable.rb"
class Rook < Piece
    include Slideable

    def symbol
        "♜".colorize(color)
    end

    def moves_dirs
        horizontal_dirs
    end
    
end