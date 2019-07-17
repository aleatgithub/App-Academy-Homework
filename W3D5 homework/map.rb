
class Map

attr_reader :array 

def initialize
  @array = []
end

def set(key, value)
  pair_idx = array.index {|pair| pair[0] == key}
  if pair_idx
    array[pair_idx][1] = valule
   else
  array.push([key,value])
  end
end


 def set(key, value)
    pair_index = underlying_array.index { |pair| pair[0] == key }
    if pair_index
      underlying_array[pair_index][1] = value
    else
      underlying_array.push([key, value])
    end
    value
  end

def get(key)
  array.each { |pair| return pair[1] if pair[0] == key }
  nil
end

def delete(key)
   value = get(key)
   array.reject! { |pair| pair[0] == key }
   value
end

def show
 #not sure what to do here. 
end


end
