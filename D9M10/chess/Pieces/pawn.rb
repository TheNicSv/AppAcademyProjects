require_relative "piece.rb"

class Pawn < Piece
  def symbol
    "♟︎".colorize(color)
  end

  def moves
    side_attacks + forward_steps
  end

  private

  def at_start_row?
    return true if color == :black && pos[0] == 6
    return true if color == :white && pos[0] == 1
    false
  end

  def side_attacks
    x, y = pos
    a = forward_direc
    diagonals = [[x + a, y + 1], [x + a, y - 1]]
    diagonals.select do |pos|
      next false unless board.valid_pos?(pos)
      next false if board.empty?(pos)

      possible_attack = board[pos]
      possible_attack && possible_attack.color != color
    end
  end

  def forward_steps
    a = forward_direc
    x, y = pos
    moves = [[x + a,y]]
    moves << [x+ 2*a,y] if at_start_row?
    moves
  end

  def forward_direc
    return -1 if color == :black
    return 1 if color == :white
  end
end
