require_relative "board.rb"
require "byebug"
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
        x, y = index_finder
        a = [[x-1,y],[x-1,y+1],[x,y+1],[x+1,y+1],[x+1,y],[x+1,y-1],[x,y-1],[x-1,y-1]]
        a.select do |ele|
            ele.none?{|n| n > 8 || n < 0}
        end
    end

    def to_s
        return "F" if flagged
        return neighbor_bomb_counter if revealed
        return "*"
    end

    def index_finder
        x, y = 0, 0
        @board.grid.each_with_index do |sub, i1|
            sub.each_with_index do |ele, i2|
               x, y = i1, i2 if ele == self
            end
        end
        [x,y]
    end

    def neighbor_bomb_counter
        count = 0
        neighbors.each do |nei|
            count += 1 if @board[nei].bomb
        end
        count
    end

    def inspect
        
    end

end