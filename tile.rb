require_relative "board.rb"
class Tile
    attr_reader :revealed, :flagged
    attr_accessor :bomb
    def initialize(board,bomb=false)
        @bomb = bomb
        @revealed = false
        @flagged = false
        @board = board
    end

    def reveal!
        @revealed = true
    end

    def flag!
        @flagged = true
    end

    def neighbors
        x, y = @pos
        [[x-1,y],[x-1,y+1],[x,y+1],[x+1,y+1],[x+1,y],[x+1,y-1],[x,y-1],[x-1,y-1]]
    end

    def to_s
        return "F" if flagged
        return " " if revealed
    end

end