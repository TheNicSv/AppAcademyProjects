require_relative "board.rb"
require "yaml"
class Game
    def load_board
        yaml = YAML.load_file("saved.yml")
    end
    def initialize(saved= nil)
        new_g = Board.new
        new_g.populate
        if saved
            @board = load_board
        else
            @board = saved || new_g
        end
        @exit = false
        @lost = false

        system ("clear")
    end


    def run
        @exit = false
        system ("clear")

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
            if @board[pos].flagged
               puts "You cannot reveal a flagged position"
               return
            end
            @lost = true if @board[pos].bomb
            @board.revealer(pos)
        when "e"
            @exit = true
        when "s"
            puts "SAVED"
            File.open("saved.yml", "w") { |f| f.write @board.to_yaml }
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
