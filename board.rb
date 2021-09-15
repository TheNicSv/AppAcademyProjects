require_relative "tile.rb"
require "byebug"
class Board
    attr_reader :grid
    def initialize(size=9)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
    end

    def populate
        fill_grid_with_empty
        until bomb_counter == 9
            bomb_placer
        end
    end

    def render
        puts "  #{(0...@size).to_s}"
        @grid.each_with_index{|sub, i| puts "#{i} #{sub}"}
    end



    private


    def fill_grid_with_empty
        @grid.map!.with_index do |sub, x|
            sub.map.with_index do |ele, y|
                Tile.new(self)
            end
        end
    end

    def bomb_placer
        nums = (0...@size).to_a
        x = nums.sample
        y = nums.sample
        @grid[x][y] = Tile.new(self,true)        
    end

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