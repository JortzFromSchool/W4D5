# O(n^2)
def windowed_max_range(array, window_size)
    current_max_range = nil
    array.each_with_index do |ele, i|
        slice = array[i...i + window_size]
        min = slice.min
        max = slice.max
        current_max_range = max - min if current_max_range.nil? || max - min > current_max_range
    end
    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
        @queue = []
    end

    def enqueue(value)
        @queue.push(value)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end

    def size
        @queue.size
    end

    def empty?
        @queue.empty?
    end
end

class MyStack
    def initialize
        
    end

end