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
  
  def previous_infinitive_link(current_verb)
    conjugation = Conjugation.in_infinitive.find_by_content(current_verb).previous_infinitive
    link_to conjugation, verb_path(:s => conjugation.content) if conjugation
  end

  def next_infinitive_link(current_verb)
    conjugation = Conjugation.in_infinitive.find_by_content(current_verb).next_infinitive
    link_to conjugation, verb_path(:s => conjugation.content) if conjugation
  end

end
