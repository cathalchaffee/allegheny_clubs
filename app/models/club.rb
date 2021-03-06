class Club < ActiveRecord::Base
  has_many :topics, dependent: :destroy

  has_and_belongs_to_many :users

  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false } 
  validates :about, presence: true
end
