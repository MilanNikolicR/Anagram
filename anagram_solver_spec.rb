require 'rspec'
require './anagram_solver'

describe AnagramSolver do

  describe ".new" do

  	it "populates dictionary with given words" do
      dictionary = ["abba", "bbaa", "ca", "ba"]
      anagram_solver = AnagramSolver.new(dictionary)

      expect(anagram_solver.dictionary).to eq(dictionary)
  	end

    it "removes all whitespace from words" do
      dictionary = ["ab ba ", "  bbaa\n", "  ca", " ba  ", "makijato"]
      expected_dictionary = ["ab ba", "bbaa", "ca", "ba", "makijato"]
      anagram_solver = AnagramSolver.new(dictionary)

      expect(anagram_solver.dictionary).to eq(expected_dictionary)
    end

  end

  describe ".anagrams" do

    it "returns list of anagrams" do
      dictionary = ["abba", "abcc", "abc", "bbaa", "cba", "ba", "bca"]
      expected_anagrams = [["abba", "bbaa"], ["abc", "cba", "bca"]]
      anagram_solver = AnagramSolver.new(dictionary)

      expect(anagram_solver.anagrams).to eq(expected_anagrams)
    end

    it "ignores everything except letters" do
      dictionary = ["1", "abba", "bbaa", "man's" ,"sman"]
      expected_anagrams=[["abba","bbaa"],["mans","sman"]]
      anagram_solver = AnagramSolver.new(dictionary)

      expect(anagram_solver.anagrams).to eq(expected_anagrams)
    end  

    it "ignores lettercase" do
      dictionary = ["abc", "aBbA", "BbAa", "ma'N" ,"Nam"]
      expected_anagrams=[["abba","bbaa"],["man","nam"]]
      anagram_solver = AnagramSolver.new(dictionary)

      expect(anagram_solver.anagrams).to eq(expected_anagrams)
    end

    it "ignores words with one character" do
      dictionary = ["abba", "bbaa", "acb" ,"abc", "b", "a"]
      expected_anagrams=[["abba","bbaa"],["acb","abc"]]
      anagram_solver = AnagramSolver.new(dictionary)

      expect(anagram_solver.anagrams).to eq(expected_anagrams)
    end
    it "ignores words without anagrams" do
      dictionary = ["abba", "bbaa", "abc" ,"ab", "efg", "ba"]
      expected_anagrams=[["abba","bbaa"],["ab","ba"]]
      anagram_solver = AnagramSolver.new(dictionary)

      expect(anagram_solver.anagrams).to eq(expected_anagrams)
    end
  end

end