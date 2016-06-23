class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true

end
