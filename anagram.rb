require './anagram_solver'

dictionary = IO.readlines('anagrams-wordlist.txt', encoding: 'iso-8859-1:utf-8')

AnagramSolver.new(dictionary).anagrams.each do |words|
    puts words.join(" ")
  
end