require_relative "cursor.rb"
class HumanPlayer
  def initialize(color, display)
    @color = color
    @display = display
  end

  attr_reader :color, :display

  def make_move(_board)
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      display.render
      if start_pos
        puts "#{color}'s turn. where do you wanto to move to?"
        end_pos = display.cursor.get_input
        display.reset! if end_pos
      else
        puts "#{color}'s turn.from where do you want to move?"
        start_pos = display.cursor.get_input
        display.reset! if start_pos
      end
    end

    [start_pos, end_pos]
  end
end
