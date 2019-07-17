require_relative 'my_queue'

class Node

  def initialize(value, children = [])
    @value = value
    @children = children
  end


  def bfs(target)
    #1. Create a queue, with root node inside.
    node_queue = Queue.new()
    node_queueu.enqueue(self) # self is the root node

    until node_queue.empty?
      #2a - dequeue node
      curr_node = node.queue.dequeue
      #2b - Check node value against target
      return curr_node if curr_node.value == target
      #2c - Add children to queue
      curr_node.children.each do |child|
        node_queue.enqueue(child)
        end
      end
    end
  end



end

