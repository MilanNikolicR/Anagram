require 'open-uri'
 
anagram = Hash.new {|hash, key| hash[key] = []} 
def anagram_groups(anagram)
  open('anagrams-wordlist.txt', 'r:iso-8859-1:utf-8') do |f|
  words = f.read.split
    for word in words
      anagram[word.split('').sort] << word
    end
  end
  anagram.each_value do |ana|
    if ana.length >= 2
      p ana
    end
  end
end
anagram_groups(anagram)