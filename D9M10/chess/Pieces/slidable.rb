module Slideable
    DIANGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
    ].freeze

    HORIZONTAL_AND_VERTICAL_DIRS = [
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0]
    ].freeze

    def moves
        moves = []
        moves_dirs.each do |possible|
            dx, dy = possible
            moves.concat(grow_unblocked_moves_in(dx, dy))
        end
        moves
    end
    
    def horizontal_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIANGONAL_DIRS
    end

    private

    def moves_dirs
        raise "Not implicit direction movement"
    end

    def grow_unblocked_moves_in(dx,dy)
        cur_x, cur_y = pos
        moves = []
        loop do
            cur_x, cur_y = cur_x + dx, cur_y + dy
            pos = [cur_x, cur_y]
            break if !board.valid_pos?(pos)

            if board.empty?(pos)
                moves << pos
            else
                moves << pos if board[pos].color != color
                break
            end
        end
        moves
    end
end