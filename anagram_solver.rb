require 'open-uri'
 
class AnagramSolver
  attr_accessor :dictionary
  def initialize(dictionary)
    self.dictionary = dictionary.map { |word| word.strip }
  end

  def anagrams
    anagram_groups = Hash.new {|hash, key| hash[key] = []} 

    for word in dictionary
      word=word.downcase.gsub(/\W/, '')
      anagram_groups[word.downcase.split('').sort] << word.downcase
    end
    
    result = []
    anagram_groups.each_value do |words|
      if words.length >= 2
        result << words
      end
    end

    result
  end
end
