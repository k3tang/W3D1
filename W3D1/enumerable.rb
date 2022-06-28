class Array
  def my_each(&prc)
    self.length.times do |i|
      ele = self[i]
      prc.call(ele)
    end
    return self
  end

  # return_value = [1, 2, 3].my_each do |num|
  #  puts num
  # end.my_each do |num|
  #  puts num
  # end
  # # => 1
  #     2
  #     3
  #     1
  #     2
  #     3
  # p return_value

  def my_select(&prc)
    newarray = []
    self.my_each do |ele|
      if prc.call(ele)
        newarray << ele
      end
    end
    newarray
  end

  def my_reject(&prc)
    new_arr = []
    self.my_select do |ele|
      if !prc.call(ele)
        new_arr << ele
      end
    end

    return new_arr
  end

  def my_any?(&prc)
    self.my_each do |ele|
      if prc.call(ele)
        return true
      end
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      if !prc.call(ele)
        return false
      end
    end

    true
  end

  def my_flatten
    new_arr = []

    self.each do |ele|
      if ele.kind_of?(Array)
        new_arr += ele.my_flatten
      else
        new_arr += [ele]
      end
    end

    return new_arr
  end

  def my_zip(*arrs)
    newarray = []
    
    (0...self.length).each do |i|
      subarray = []
      subarray << self[i]
      arrs.my_each do |arr|
        subarray << arr[i]
      end 
      newarray << subarray
    end 
    return newarray
  end 


  def my_rotate(num = 1)
    new_arr = []
    (0...self.length).each do |i|
        ele = self[i]
          new_idx = (i + num) % self.length
          newele = self[new_idx]
          new_arr << newele
    end 
    return new_arr
  end

  def my_join(str = "")
    new_str = ""
   self.each.with_index do |ele, idx|
      if idx == self.length - 1
        new_str += ele  
      else
        new_str += ele + str
      end
    end 
    return new_str
  end 

  def my_reverse
    new_arr = []
    (0...self.length).reverse_each do |i|
      ele = self[i]
      new_arr << ele
    end
    return new_arr
  end



end



# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# a = ["a", "b", "c", "d"]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p[ 1 ].my_reverse               #=> [1]