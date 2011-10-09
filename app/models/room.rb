class Room < ActiveRecord::Base
  validates :name, :description, :presence => true
  validates :name, :uniqueness => true
  
  has_many :exits, :dependent => :destroy
end
