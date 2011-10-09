class Exit < ActiveRecord::Base
  validates :name, :to_room, :presence => true
  belongs_to :room
end
