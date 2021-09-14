require_relative "tile.rb"
require "byebug"
class Board
    def initialize(size=9)
        @grid = Array.new(size) {Array.new(size)}
    end

    def populate
        @grid.map!.with_index do |sub, x|
            sub.map.with_index do |ele, y|
                Tile.new([x,y])
            end
        end
        debugger
        until @grid.count{|sub| sub.count{|ele| ele.bomb == true}} == 9
            nums = (0...size).to_a
            nums.sample = x
            nums.sample = y
            @grid[x][y] = Tile.new([x,y],true)
        end
    end


end