# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.


# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do NOT use the `Array#to_s`, `Array#inspect`, or 
# `Array#digits` methods in your implementation.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

# def digital_root(num)
#   sum = 0 
# end


# we can mod by ten to get the last digit

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z). 
# **Do NOT use the `Array#sort` or `Array#sort_by` methods in your implementation.

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

# if alphabet == nil
#     #default to normal alphabetical order
#   end

def alphabet_position(char) #returns index of char in alphabet
  return alphabet.index(char)
end

def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a
  chars = str.split("")

  sorted = false

  while !sorted
    sorted = true
  
    (0...array.length - 1).each do |i|

    if alphabet_position(char) > alphabet_position(chars[idx + 1])
      chars[i], chars[i + 1] = chars[i + 1], chars[i]
      sorted = false
      end
    end
  end
  chars
end



class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    pairs = []
    self[0...self.length].each_with_index do |ele1, idx1|
      self[ele1 + 1...self.length].each_with_index do |ele2, idx2|
        pair = []
        if ele1 + ele2 == 0
          pair = [idx1, idx2]
          pairs << pair
        end
      end
    end
    pairs
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    subWords = []

  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factors = []
  (1..num).each { |i| factors << i if num % i == 0}
  factors
end
