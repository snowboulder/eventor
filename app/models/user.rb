class User < ActiveRecord::Base
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
