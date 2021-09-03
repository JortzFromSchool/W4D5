# O(n!)
def first_anagram?(str1, str2)
    perms = str1.split("").permutation.to_a
    perms.map(&:join).include?(str2)
end

# O(n^2)
def second_anagram?(str1, str2)
    str1.each_char do |char|
        index = str2.index(char)
        str2 = str2[0...index] + str2[index+1..-1] if index
    end
    str2.empty?
end

# O(nlogn)
def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end

# O(n)
def fourth_anagram?(str1, str2)
    hash = Hash.new(0)
    str1.chars.each { |char| hash[char] += 1 }
    str2.chars.each { |char| hash[char] -= 1 }
    hash.all? { |k, v| v == 0 }
end

p first_anagram?("lives", "elvis")
p second_anagram?("lives", "elvis")
p third_anagram?("lives", "elvis")
p fourth_anagram?("lives", "elvis")
