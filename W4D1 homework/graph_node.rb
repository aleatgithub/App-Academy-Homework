class GraphNode

  def initialize(value)
      self.value = value
      self.neighbors = []
  end
  def add_neighbor(node)
    self.neighbors << node
  end

  def bfs(starting_node, target_value)
    queue = [starting_node]``

    until queue.empty? 
      node = queue.shift
      return node.val if node.val == target_value
       queue += node.neighbors
    end
    return nil
  end 

end
