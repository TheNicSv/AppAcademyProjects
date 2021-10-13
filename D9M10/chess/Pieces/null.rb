require_relative "piece.rb"
require "singleton"
class NullPiece < Piece
    include Singleton

    def initialize
        @symbol = " "
        @color = :none
    end

    def empty?
        true
    end
    attr_reader :symbol

    def moves
        []
    end
end