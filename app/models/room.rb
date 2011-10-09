class Room < ActiveRecord::Base
  validates :name, :description, :presence => true
  has_many :exits, :dependent => :destroy
end
