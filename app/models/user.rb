class User < ActiveRecord::Base
  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :clubs  

  before_save { self.email = email.downcase }
  
  validates :first_name, presence: true
  
  validates :last_name, presence: true
  
  # CHECK VALID EMAIL FORMAT
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  # NOTE: includes presence validation, password_confirmation is required as well
  validates :password,  length: { minimum: 6 },
                        presence: true 
end
