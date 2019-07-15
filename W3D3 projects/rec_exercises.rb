# def range(min, max)
#   return [] if max <= min
#   range(min, max - 1) << max - 1

# end

# # p range(1,5) # [1,2,3,4]
# # p range(4,2) # []
# # p range(1,40) # 1


# def exp1(base, power)
#   return 1 if power == 0
#   base * exp1(base, power - 1)
# end

# # p exp1(2,4)
# # p exp1(2,0)
# # p exp1(5,5)

# def exp2(base, power)
#   return 1 if power == 0
  
#   half = exp2(base, power / 2)

#   if power.even?
#     half * half
#   else
#     base * half * 2
#   end

# end

# # ask clarification question for this second exercise

# class Array

#   def deep_dup
#     new_array = []
#     self.each do |ele| 
#       if ele.is_a?(Array)
#         new_array << ele.deep_dup
#       end
#     end
#     new_array
#   end
# end

# # new_arr = Array.new([1, [2], [3, [4]]])
# # p new_arr.deep_dup

# def fib_iter(n)
#  return [] if n == 0
#  return [1] if n == 1
#   fibs = [1,1]
#  while fibs.count < n
#   fibs << fibs[-1] + fibs[-2]
#  end
#  fibs 
# end

# def fibs_rec(n)
#   if n <= 2
#     [0, 1].take(n)
#   else
#     fibs = fibs_rec(n - 1)
#     fibs << fibs[-2] + fibs[-1]
#   end
# end

# #Binary Search.
# #Assume that the array is sorted
# #Array is [1,2,3,4,5,6,7]
# # Target element is 4 == Middle element is 4

# def bsearch(nums, target)
#   mid_idx = array.length / 2

#   if target == array[mid_idx]
#     return mid_idx
#   elsif target < array[mid_idx]
#     #searchign left half of the array
#       left = array[0..mid_idx - 1]
#       bsearch(left, target)
#   else
#     #search the right half of the array
#     right = array[mid_idx + 1..-1]
#     search_res = bsearch(right,target)

#     if search_res.nil?
#       nil
#     else
#       search_res + mid_idx + 1
#     end
#   end
# end

# # p bsearch([1, 2, 3], 1) # => 0
# # p bsearch([2, 3, 4, 5], 3) # => 1
# # p bsearch([2, 4, 6, 8, 10], 6) # => 2
# # p bsearch([1, 3, 4, 5, 9], 5) # => 3
# # p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# # p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# # p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# class Array
#   def merge_sort

#     return self if count < 2

#     middle = self.length / 2 

#     left = self.take(middle)
#     right = self.drop(middle)

#     sorted_left, sorted_right = left.merge_sort, right.merge_sort

#     merge(sorted_left, sorted_right)
#   end

#   def merge(left, right)
#     merged_array = []
#     until left.empty? || right.empty?
#       merged_array << (left.first < right.first) ? left.shift : right.shift
#     end

#     merged_array + left + right
#   end

  
#   def subsets
#     return [[]] if self.empty?
    
#   end

#   subsets([]) # => [[]]
#   subsets([1]) # => [[], [1]]
#   subsets([1, 2]) # => [[], [1], [2], [1, 2]]
#   subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# end

#StantonHuang Solution: 

def mergesort(array)
  #Divide
  return array if array.length <= 1

  middle = array.length / 2
  left = array[0...middle]
  right = array[middle + 1..-1]
  sorted_right = mergesort(left)
  sorted_left = mergesort(right)
  merge(sorted_left, sorted_right)

end

def merge(array1, array2)
  #Conquer
  merged = [] #every time we call merge we are goign to shift out of array 1 and array 2
  -

  until array1.empty? || array2.empty? # take this to pry 
    if array[0] > array2[0]
      merged << array2.shift
      else
      merged << array1.shift
    end
  end
  merged + array1 + array2 # one of these will be empty 
end

