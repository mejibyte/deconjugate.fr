class AddIndexToContentToConjugations < ActiveRecord::Migration
  def self.up
    add_index(:conjugations, :content)
  end

  def self.down
    remove_index(:conjugations, :content)
  end
end
