def first_anagram?(str1, str2)
    perms = str1.split("").permutation.to_a
    perms.map(&:join).include?(str2)
end

def second_anagram?(str1, str2)
    str1.each_char do |char|
        index = str2.index(char)
        str2 = str2[0...index] + str2[index+1..-1] if index
    end
    str2.empty?
end

def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end

p first_anagram?("lives", "elvis")
p second_anagram?("lives", "elvis")
p third_anagram?("lives", "elvis")