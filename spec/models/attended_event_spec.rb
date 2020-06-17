require 'rails_helper'

RSpec.describe AttendedEvent, type: :model do
  context 'Associations' do
    it 'should belong to an event' do
      t = AttendedEvent.reflect_on_association(:event)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should belong to an attendee' do
      t = AttendedEvent.reflect_on_association(:attendee)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
