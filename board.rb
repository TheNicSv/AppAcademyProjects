require_relative "tile.rb"
require "byebug"
class Board
    def initialize(size=9)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
    end

    def populate
        @grid.map!.with_index do |sub, x|
            sub.map.with_index do |ele, y|
                Tile.new([x,y])
            end
        end
        #debugger
        until bomb_counter == 9
            nums = (0...@size).to_a
            x = nums.sample
            y = nums.sample
            @grid[x][y] = Tile.new([x,y],true)
        end

    end




    private

    def bomb_counter
        count = 0
        @grid.each do |sub|
            sub.each do |ele|
                count += 1 if ele.bomb
            end
        end
        count
    end
end