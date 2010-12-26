class AddContentInAsciiToConjugations < ActiveRecord::Migration
  def self.up
    add_column :conjugations, :content_in_ascii, :string
  end

  def self.down
    remove_column :conjugations, :content_in_ascii
  end
end
