class Queue


  def initialize
    @array = []
  end

  def enqueue(el)
    array.push(el)
    el.dup
  end

  def dequeue
    array.shift
  end

  def size
    array.length
  end

  def show
    array.dup
    # we want to dup it so that the return isn't manipulated by user
  end
  
  def empty?
    array.empty?
  end

  def inspect
    "#<MyQue:#{self.object_id}>"
  end

  private

  attr_reader :array  #we don't want anyone messing with this, so we won't let them read it.

end
