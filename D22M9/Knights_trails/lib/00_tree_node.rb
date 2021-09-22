class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    attr_reader :value, :parent, :children



    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            val = child.dfs(target)
            return val if val
        end
        return nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            queue.each do |pos|
                queue += pos.children
                return pos if pos.value == target
                queue.shift
            end
        end
        return nil
    end


    def parent=(new_parent)
        @parent.children_delete(self) if @parent
        @parent = new_parent
        if new_parent
            new_parent.children = self
        end
    end
    
    def children=(child)
        @children += [child] if !@children.include?(child)        
    end

    def children_delete(child)
        @children.delete(child)
    end

    def add_child(child_node)
        child_node.parent = self
        self.children = child_node
    end

    def remove_child(child_node)
        if child_node && !self.children.include?(child_node)
            raise "Tried to remove node that isn't a child"
        end
        child_node.parent = nil
        self.children_delete(child_node)
    end
end