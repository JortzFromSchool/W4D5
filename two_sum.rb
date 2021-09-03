
# O(n^2)
def two_sum?(arr, target_sum)
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            return true if ele1 + ele2 == target_sum && idx1 != idx2
        end
    end
    false
end


# O(nlogn)
def okay_two_sum?(arr, target_sum)
    sorted = arr.sort
    sorted.each_with_index do |ele1, idx1|
        return false if ele1 > target_sum

        return true if sorted.bsearch { |x| x == target_sum - ele1 && arr.index(x) != idx1 }
    end
    false
end

arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false