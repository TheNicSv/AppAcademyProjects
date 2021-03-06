require_relative "tile.rb"
require "byebug"
class Board
    attr_reader :grid, :size
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
        puts "  #{(0...@size).to_a.join(" ")}"
        @grid.each_with_index do |sub, i|
            puts "#{i} #{sub.join(" ")}"
        end
        nil
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def revealer(pos)
        if bomb_pos?(pos)
            self[pos].flag!
            return false
        end
        return nil if self[pos].flagged
        return self[pos].reveal! if self[pos].neighbor_bomb_counter != 0
        if self[pos].neighbor_bomb_counter == 0
            self[pos].reveal!
            self[pos].neighbors.each{|n| revealer(n) if !self[n].revealed}
        end
    end

    def flagger(pos)
        self[pos].flag!
    end

    def won?
        @grid.each do |sub|
            sub.each do |ele|
                return false if !ele.revealed && !ele.bomb
            end
        end
        return true
    end

    private

    def bomb_pos?(pos)
        self[pos].bomb
    end

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

    def inspect
        self.render
    end
end
