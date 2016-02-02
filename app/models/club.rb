class Club < ActiveRecord::Base
  has_many :topics, dependent: :destroy

  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false } 
  validates :about, presence: true
end
