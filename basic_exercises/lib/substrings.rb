def substrings(text, dictionary)
  results = {}
  for target_word in dictionary
    if text.scan(/#{target_word}/i).length ==0
      next
    else
      results[target_word] = text.scan(/#{target_word}/i).length
    end
  end
  puts results
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


substrings("below", dictionary)
# expected output {"below"=>1, "low"=>1}

substrings("Howdy partner, sit down! How's it going?", dictionary)
# expected output {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
