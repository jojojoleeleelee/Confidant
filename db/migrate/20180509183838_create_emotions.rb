class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.string :name
      t.string :content
      t.string :verse
      t.string :user_id
    end
  end
end
