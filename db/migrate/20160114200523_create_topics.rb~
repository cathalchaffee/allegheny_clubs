class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.belongs_to :club, index: true
      t.text :text
      t.timestamps null: false
    end
  end
end
