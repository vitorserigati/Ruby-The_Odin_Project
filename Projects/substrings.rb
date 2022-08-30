def substrings(string, array)
  hash = Hash.new(0)
  text = string.downcase
  array.each do |word|
    found_word = text.scan(word).length
    hash[word] = found_word unless found_word.zero?
  end
  hash
end

dictionary = %w[below down go going
                horn how howdy
                it i low own
                part partner sit]

sei_la = substrings('below, this', dictionary)

puts sei_la
