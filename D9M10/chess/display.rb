require 'colorize'
require_relative "cursor.rb"
require_relative "board.rb"

# class in charge of rendering beautifuly the board
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    build_grid.each { |row| puts row.join }
    nil
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |ele, j|
      colors = colors_for(i,j)
      ele.to_s.colorize(colors)
    end
  end

  def colors_for(i,j)
    if @cursor.cursor_pos == [i,j] && @cursor.selected
      bg = :light_green
    elsif @cursor.cursor_pos == [i,j]
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :light_yellow
    end
    { background: bg }
  end
end
