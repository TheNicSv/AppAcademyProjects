require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark, @prev_move_pos = board, next_mover_mark, prev_move_pos
  end

  def children
    children = []
    (0..2).each do |i1|
      (0..2).each do |i2|
        if board.empty?([i1,i2])
          new_board = board.dup
          pos = [i1, i2]
          new_board[pos] = self.next_mover_mark
          next_marker = (self.next_mover_mark == :x ? :o : :x)
          children << TicTacToeNode.new(new_board, next_marker,pos)
        end
      end
    end
    children
  end

  def losing_node?(evaluator)
    if board.over?
      #If the game is over, and it is not tied, and im not the winner then its a losing node
      return board.won? && board.winner != evaluator
    end

    if next_mover_mark == evaluator
      #if it is my turn
      self.children.all?{|ele| ele.losing_node?(evaluator)}
    else
      self.children.any?{|ele| ele.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.won? && board.winner == evaluator
    end

    if next_mover_mark == evaluator
      self.children.any?{|ele|ele.winning_node?(evaluator)}
    else
      self.children.all?{|ele|ele.winning_node?(evaluator)}
    end
  end

end
