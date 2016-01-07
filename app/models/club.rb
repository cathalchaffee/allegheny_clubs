class Club < ActiveRecord::Base
  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false } 
  validates :about, presence: true
end
