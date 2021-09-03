def my_min(list)
    list.each do |ele1|
        min = true
        list.each do |ele2|
            min = false unless ele1 <= ele2 
        end
        return ele1 if min
    end
end

def my_min2(list)
    min = list.first
    list.each do |ele|
        min = ele if ele < min
    end
    return min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
# p my_min2(list) # => -5

def largest_contiguous_subsum(list)
    subs = []
    list.each_with_index do |ele1, i1|
        list.each_with_index do |ele2, i2|
            subs << list[i1..i2] unless i2 < i1
        end
    end

    subs.map(&:sum).max
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])