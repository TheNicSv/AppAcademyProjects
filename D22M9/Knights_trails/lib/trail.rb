require_relative "00_tree_node.rb"
require "byebug"

class Knights
    MOVES = [
        [2,1],
        [1,2],
        [-1,2],
        [-2,1],
        [-2,-1],
        [-1,-2],
        [1,-2],
        [2,1]
    ]
    def self.valid_move(position)
        x, y = position
        valid = []
        MOVES.each do |move_1|
            #debugger
            new_move = [(x + move_1[0]), (y + move_1[1])]
            if new_move.all?{|i| i < 8 && i >= 0}
                valid << new_move
            end
        end
        
        valid
    end
    attr_accessor :root_node

    def initialize(pos)
        @pos = pos
        @root_node = nil
        @considered_positions = [@pos]
        build_move_tree
    end

    def find_path(end_pos)
        ending = @root_node.dfs(end_pos)
        trace_path_back(ending).reverse
    end

    def trace_path_back(end_node)
        path = []
        node = end_node
        until node.nil?
            path << node.value
            node = node.parent
        end
        path
    end

    def build_move_tree
        @root_node = PolyTreeNode.new(@pos)
        nodes = [@root_node]
        until nodes.empty?
            current = nodes.shift
            new_move_positions(current).each do |ele|
                new_node = PolyTreeNode.new(ele)
                current.add_child(new_node)
                nodes << new_node
            end
        end
    end

    def new_move_positions(node)
        #debugger
        initial = node.value
        positions = Knights.valid_move(initial).reject{|ele| @considered_positions.include?(ele)}.each{|ele| @considered_positions << ele}
        positions
    end
end