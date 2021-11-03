require_relative "pieces.rb"
require "byebug"

class Board
  attr_reader :rows

  def initialize(fill)
    @sentinel = NullPiece.instance
    @rows = Array.new(8){Array.new(8, @sentinel)}
    set_board if fill
  end

  def [](pos)
    raise "invalid pos" if !valid_pos?(pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos,pice)
    raise "invalid_pos" if !valid_pos?(pos)
    x, y = pos
    @rows[x][y] = pice
  end

  def move_piece(current_color, start_pos, end_pos)
    raise "Start_pos empty please retry" if empty?(start_pos)
    piece = self[start_pos]
    raise "you have to move your own pice" if current_color != self[start_pos].color
    #debugger
    raise "pice cannot go there" unless piece.valid_moves.include?(end_pos)
    self[start_pos] = @sentinel
    self[end_pos] = piece
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    self[start_pos] = @sentinel
    self[end_pos] = piece
  end

  def add_piece(pice, pos)
    self[pos] = pice
  end

  def valid_pos?(pos)
    pos.none?{|i| i > 7 || i < 0}
  end

  def empty?(pos)
    #debugger
    x, y = pos
    @rows[x][y].empty?
  end

  def find_king(color)
    king_location = []
    @rows.each_with_index do |sub, i|
      i2 =  sub.find_index{ |x| x.is_a?(King) && x.color == color }
      king_location = [i, i2] if i2
    end
    king_location
  end

  def in_check?(color)
    king_pos = find_king(color)
    @rows.any? do |sub|
      sub.any?{|piece| piece.color != color && piece.moves.include?(king_pos)}
    end
  end

  def check_mate(color)
    return false unless in_check?(color)
    pieces.select { |p| p.color == color }.all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def dup
    dup = Board.new(false)
    pieces.each do |p|
      p.class.new(p.color, dup, p.pos)
    end
    dup
  end

  private

  def pieces
    @rows.flatten.reject(&:empty?)
  end

  def set_board
    set_pawns
    set_back_rows
  end

  def set_pawns
    (0...8).each{ |i| Pawn.new(:white, self,[1,i])}
    (0...8).each{ |i| Pawn.new(:black, self,[6,i])}
  end

  def set_back_rows
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    i = 0
    pieces.each do |piece|
      piece.new(:white, self,[0,i])
      piece.new(:black, self,[7,i])
      i += 1
    end
  end
end
