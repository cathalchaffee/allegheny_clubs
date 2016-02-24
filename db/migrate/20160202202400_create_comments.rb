class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.belongs_to :topic, index: true

      t.timestamps null: false
    end
  end
end
