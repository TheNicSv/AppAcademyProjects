require_relative "cursor.rb"
class HumanPlayer
  def initialize(color, display)
    @color = color
    @display = display
  end

  attr_reader :color, :display

  def make_move
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      display.render
      if start_pos
        end_pos = display.cursor.get_input
      else
        start_pos = display.cursor.get_input
      end
    end

    [start_pos, end_pos]
  end
end
