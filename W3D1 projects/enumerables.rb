require "byebug"

class Array


#My Each
#Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array. Do not use Enumerables each method. I want to be able to write:
# # calls my_each twice on the array, printing all the numbers twice.


def my_each(&prc)
    i=0
    while i < self.length
        prc.call(self[i])
        i += 1
    end
    self
end 


return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
## => 1
#     2
#     3
#     1
#     2
#     3
#
p return_value  # => [1, 2, 3]


#My Select
#Now extend the Array class to include my_select that takes a block and returns a new array containing only elements that satisfy the block. Use your my_each method!
#
def my_select(&prc)
  new_arr = []
  self.my_each { |el| new_arr << el if prc.call(el) }
  new_arr
end


#Example:
#
a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []




#My Reject
#Write my_reject to take a block and return a new array excluding elements that satisfy the block.

def my_reject(&prc)
    new_arr = []
    self.my_each { |el| new_arr << el if !prc.call(el) }
    new_arr
end
#Example:
#
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]
#My Any
#Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.
#
def my_any?(&prc)
  self.my_each { |el| return true if prc.call(el) }
  false
end

def my_all?(&prc)
  self.my_each { |el| return false if !prc.call(el) }
  true
end

#Example:
#
a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true
#Array
#My Flatten
#my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

def my_flatten

    flattened = []
    self.my_each do |ele|
        if ele.kind_of?(Array)
            flattened += ele.my_flatten
        else 
            flattened << ele
        end 
    end 
    flattened
end    

#Example:
#
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]



#My Zip
#Write my_zip to take any number of arguments. 
#It should return a new array containing self.length elements. 
#Each element of the new array should be an array with a length of the input 
#arguments + 1 and contain the merged elements at that index. If the size of any 
#argument is less than self, nil is returned for that location.
#

def my_zip(*args)
  results = Array.new(self.length) {Array.new(self.length, nil)}
  elements = [self] + args 
  # debugger
  i = 0
  while i < self.length
    elements.each_with_index do |sub_arr, idx|
      results[i][idx] = sub_arr[i]
    end
    i += 1
  end
  results 
end

#Example:
#
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
#My Rotate
#Write a method my_rotate that returns self rotated. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.


def my_rotate(num=1)
    if num >= 0 
        num.times do 
            first_ele = self.shift
            self.push(first_ele)
        end 
    else 
        num.abs.times do
        last_ele = self.pop
        self.unshift(last_ele)
        end 
    end 
    self
end 

#Example:
#
#a = [ "a", "b", "c", "d" ]
#p a.my_rotate         #=> ["b", "c", "d", "a"]
#a = [ "a", "b", "c", "d" ]
#p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
#a = [ "a", "b", "c", "d" ]
#p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
#a = [ "a", "b", "c", "d" ]
#p a.my_rotate(-2)     #=> ["d", "a", "b", "c"]



#My Join
#my_join returns a single string containing all the elements of the array, separated by the given string separator. If no separator is given, an empty string is used.
#

def my_join(space="")
  new_str = ""
  self[0...-1].each { |el| new_str += el + space }
  new_str += self[-1]
  new_str 
end


#Example:
#
a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

#My Reverse
#Write a method that returns a new array containing all the elements of the original array in reverse order.
#

def my_reverse
    new_arr = []
    ((self.length-1).downto(0)).each { |i| new_arr << self[i] }
    new_arr
end 

#Example:
#
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

end 