class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :attended_events
    has_many :attendees, through: :attended_events, source: :event

end
