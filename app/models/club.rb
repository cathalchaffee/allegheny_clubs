class Club < ActiveRecord::Base
  validates :name, presence: true
  validates :about, presence: true
end
