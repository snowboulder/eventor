class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"

  has_many :invitations, :foreign_key => "attended_event_id"
  has_many :attendees, through: :invitations

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true

end
