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
end

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# def my_reject
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
