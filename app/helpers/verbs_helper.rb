module VerbsHelper
  def conjugation_matches?(conjugation, query)
    conjugation.split(/\W/).include?(query)
  end
  
  def reverse_words(string)
    string.split.reverse.join(" ")
  end
end
