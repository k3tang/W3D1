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

end 

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

    def my_reject