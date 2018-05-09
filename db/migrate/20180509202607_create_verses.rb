class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.string :verse
    end
  end
end
