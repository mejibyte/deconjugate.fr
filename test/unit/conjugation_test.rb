require 'test_helper'

class ConjugationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "conjugations should have a unique <content, verb> pair" do
    valid_conjugation = Conjugation.create(:content => "suis", :verb_in_infinitive => "être")
    assert valid_conjugation.valid?
    
    invalid_conjugation = Conjugation.create(:content => "suis", :verb_in_infinitive => "être")
    assert invalid_conjugation.errors[:content].size > 0
    
    another_valid_conjugation = Conjugation.create(:content => "suis", :verb_in_infinitive => "suivre")
    assert another_valid_conjugation.valid?
  end
end
