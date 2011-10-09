class User < ActiveRecord::Base
  validates :username, :hashed_password, :salt, :presence => true
  validates :username, :uniqueness => true
  
end
