
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

        result = bsearch(sorted, target_sum - ele1)
        return true unless result == idx1 || result == nil 
    end
    false
end

def bsearch(arr, target)
    return nil if arr.length == 0
    middle = arr.length/2
    return middle if arr[middle] == target
    bsearch(arr.take(middle), target) if target < arr[middle]
    if target > arr[middle]
        result = bsearch(arr.drop(middle+1), target)
        return result.nil? ? nil : middle + 1 + result
    end
    nil
end


#O(n)
def good_two_sum?(arr, target_sum)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end

    hash.each_key do |key|
        hash[key] -= 1
        return true if hash.has_key?(target_sum - key) && hash[target_sum - key] > 0
    end
    return false
end

arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
p good_two_sum?(arr, 6) # => should be true
p good_two_sum?(arr, 10) # => should be false