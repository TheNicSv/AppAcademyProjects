class Tile
    attr_reader :revealed, :flagged
    attr_accessor :bomb
    def initialize(pos,bomb=false)
        @bomb = bomb
        @revealed = false
        @flagged = false
        @pos = pos
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

    
end