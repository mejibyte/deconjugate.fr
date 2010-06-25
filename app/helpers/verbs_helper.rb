module VerbsHelper
  def conjugation_matches?(conjugation, query)
    conjugation.split(/\W/).include?(query)
  end
  
  def reverse_words(string)
    string.split.reverse.join(" ")
  end
  
  def example_link(text, verb = nil)
    content_tag :span, link_to(text, "#", :rel => verb || text), :class => "examples"
  end
end
