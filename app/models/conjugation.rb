class Conjugation < ActiveRecord::Base
  validates_presence_of :content, :verb_in_infinitive
  validates_uniqueness_of :content, :scope => [:verb_in_infinitive]
  
  named_scope :in_infinitive, :conditions => "content = verb_in_infinitive"
  
  def to_s
    content
  end
end
