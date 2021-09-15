class Game
    def initialize
        @board = Board.new
    end

    def run
        system ("clear")
        @board.populate
        @board.render
        until @board.won?
            pos = ask_for_pos
            ask_to_do(pos)
            @board.render
        end
        return "YOU WON!!!!!"
    end

    #private

    def ask_for_pos
        puts "> Enter the position brody... like so ´2,3´"
        pos = parse_pos(gets.chomp)
        until valid_pos(pos)
            puts "> Please try again chango remember the , "
            pos = parse_pos(gets.chomp)
        end
    end

    def ask_to_do

    end

    def parse_pos(string)
        string.split(",").map{|ele| ele.to_i}
    end

end