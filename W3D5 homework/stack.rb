class Stack
 
  def initialize
    @array = []
  end

  def push(el)
    array.push(el)
    el.dup
  end

  def pop
    array.pop
  end

  def peek
    array.last
  end

  private
   attr_reader :array #don't want anyone messing with this, so we'll make it private
  
end

