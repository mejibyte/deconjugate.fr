class Verb
  LONGEST = 50 # Let's assume the longest verb has at most 100 characters.
  
  attr_accessor :conjugation
  
  def initialize(infinitive)
    s = %x(french-conjugator --pronouns --utf8 #{infinitive})
    raise ArgumentError.new("'#{infinitive}' is not a valid verb") if s == /-\n/ 
    @conjugation = { }
    tense, conjugations = "", []
    s.each_line do |line|
      line.chomp!
      if line.starts_with? "-"
        @conjugation[tense] = conjugations unless tense.blank?
        tense = line[2..-2] # Deletes the first two and last character. Ex: "- participle past:" => "participle past"
        conjugations = []
      else
        conjugations << line
      end
    end
  end
  
  # Returns an array of verbs that have 'tense' in one of their conjugated forms.
  def self.build(tense)
    s = %x(french-deconjugator --utf8 #{tense})
    verbs = s.split($/).collect { |t| t.split(",").first }.uniq
    verbs.collect { |v| Verb.new(v) }
  end
  
  def infinitive
    conjugation["infinitive present"]
  end
  
  def displayed_conjugation
    conjugation.reject do |key, value|
      key == "infinitive present" || !value.collect { |s| s.blank? }.include?(false)
    end
  end
end