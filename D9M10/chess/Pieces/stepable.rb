module Stepable
    def moves
        moves = []
        moves_dirs.each do |(dx,dy)|
            x, y = pos
            current_pos = [x + dx, y + dy]
            next if !board.valid_pos?(current_pos)
            if board[current_pos].empty?
                moves << current_pos
            elsif board[current_pos].color =! color
                moves << current_pos
            end
        end
        moves
    end
    
    
    def move_dirs
        raise "NOt diffined in specific class"
    end
end