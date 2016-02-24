class CreateClubsUsers < ActiveRecord::Migration
  def change
    create_table :clubs_users do |t|
      t.belongs_to :club, index: true
      t.belongs_to :user, index: true
    end
  end
end
