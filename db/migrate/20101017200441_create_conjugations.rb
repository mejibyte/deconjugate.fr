class CreateConjugations < ActiveRecord::Migration
  def self.up
    create_table :conjugations do |t|
      t.string :content
      t.string :verb_in_infinitive

      t.timestamps
    end
  end

  def self.down
    drop_table :conjugations
  end
end
