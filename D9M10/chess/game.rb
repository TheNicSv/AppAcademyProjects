require_relative "board.rb"
require_relative "display.rb"
require_relative "human.rb"
class Game
  attr_reader :players, :display, :board, :current_player
  def initialize
    @board = Board.new(true)
    @display = Display.new(@board)
    @players = {
      white: HumanPlayer.new(:white, @display),
      black: HumanPlayer.new(:black, @display)
    }
    @current_player = :white
  end

  def play
    until board.check_mate(current_player)
      begin
        start_pos, end_pos = players[current_player].make_move(board)
        board.move_piece(current_player, start_pos, end_pos)

        swap_turn!
        notify_players
      rescue StandardError => e
        @display.notifications[:error] = e.message
        retry
      end
    end

    display.render
    puts "#{current_player} is checkmated."

    nil
  end



  private

  def swap_turn!
    if @current_player == :white
       @current_player = :black
    else
      @current_player = :white
    end
  end

  def notify_players
    if board.in_check?(current_player)
      display.set_check!
    else
      display.uncheck!
    end
  end

end
