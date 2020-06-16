class User < ApplicationRecord
    has_many :events, class_name: 'Event', foreign_key: :creator_id
    has_many :attended_events, foreign_key: 'attendee_id'
    has_many :events, through: :attended_events
end
