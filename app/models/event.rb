class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :attended_events
    has_many :attendees, through: :attended_events
    scope :upcoming_events, -> { where('date >= ?', Date.today) }
    scope :previous_events, -> { where('date < ?', Date.today) }
     validates :date, :title, :description, presence: true

end
