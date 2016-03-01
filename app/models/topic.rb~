class Topic < ActiveRecord::Base
  belongs_to :club
  has_many :comments, dependent: :destroy
end
