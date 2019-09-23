require "byebug"

# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  check = num_1 <=> num_2
  return num_1 if check == 0
  if check == -1
    lcm = num_2
    while true
      return lcm if lcm % num_1 == 0
        lcm += num_2
    end
  else
    lcm = num_1
    while true
      return lcm if lcm % num_2 == 0
      lcm += num_1
    end
  end
  # (1..num_1 * num_2).each do |i|
  #   return i if i % num_1 == 0 && i % num_2 == 0
  # end
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    str.each_char.with_index do |char, idx|
      key = char + str[idx + 1] if idx < str.length - 1
      hash[key] += 1
    end

    hash.key(hash.values.max)
end

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    new_hash = {}
    self.each {|k, v| new_hash[v] = k}
    new_hash
  end
end

class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    matches = 0
    self.each_with_index do |n1, i1|
      self.each_with_index do |n2, i2|
       matches += 1 if (i1 < i2) && (n1 + n2 == num)
      end
    end
    matches
  end


  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  def bubble_sort(&prc)
    prc ||= Proc.new {|a, b| a <=> b}
    sorted = false
    while !sorted
      sorted = true
      (0...self.length - 1).each do |i|
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    self
  end
end