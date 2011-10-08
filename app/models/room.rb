class Room < ActiveRecord::Base
  has_many :exits, :dependent => :destroy
end
