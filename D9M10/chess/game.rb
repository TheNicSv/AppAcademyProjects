class Game
  def initialize
    @board = Board.new(true)
    @display = Display.new(@board)
    @players = {
      white: HumanPlayer.new(:white, @display)
      black: HumanPlayer.new(:black, @display)
    }
    @current_player = :white
  end





  private

  def swap_players
    if @current_player == :white
       @current_player = :black
    else
      @current_player = :white
    end
  end

end
