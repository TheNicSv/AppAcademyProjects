require_relative "board.rb"
class Game
    def initialize
        @board = Board.new
        @exit = false
        @lost = false
    end

    def run
        @exit = false
        @lost = false
        system ("clear")
        @board.populate
        @board.render
        until @board.won? || @lost || @exit
            ask_to_do
            @board.render
        end
        return "YOU LOST!!!!" if @lost
        return "YOU WON!!!!!" if @board.won?
    end

    #private

    def ask_to_do
        puts "please enter what would you, like to do==> (flag => f), (reveal => r), (exit => e), (save => s)"
        input = gets.chomp
        case input
        when "f"
            @board.flagger(ask_for_pos)
        when "r"
            pos = ask_for_pos
            @lost = true if !@board.revealer(pos)
        when "e"
            @exit = true
        when "s"
            puts "SAVED"
        else
            puts "UKNOWN COMAND"
            ask_to_do
        end

    end

    def ask_for_pos
        puts "> Enter the position brody... like so ´2,3´"
        pos = parse_pos(gets.chomp)
        until valid_pos(pos)
            puts "> Please try again chango remember the , "
            pos = parse_pos(gets.chomp)
        end
        pos
    end

    def parse_pos(string)
        string.split(",").map{|ele| ele.to_i}
    end

    def valid_pos(pos)
       return false if !pos.is_a?(Array)
       return false if pos.count != 2
       return false if pos.any?{|ele| ele.is_a?(String)}
       return false if pos.any?{|ele| ele > 8}
       return true
    end

end