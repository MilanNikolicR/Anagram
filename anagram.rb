require 'open-uri'
 
anagram = Hash.new {|hash, key| hash[key] = []} 
 
File.open('unixdict.txt') do |f|
  words = f.read.split
  for word in words
  	if ! word.valid_encoding?
  		word = word.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
  		word.gsub(/dr/i,'med')
	end
    anagram[word.split('').sort] << word
  end
end
 
count = anagram.values.map {|ana| ana.length}.max
anagram.each_value do |ana|
  if ana.length >= count
    p ana
  end
end
