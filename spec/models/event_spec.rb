require 'rails_helper'

RSpec.describe Event, type: :model do
  User.create(username: "JAne")
  context "validations" do
     subject do
         described_class.new(date: "2020/07/07", title: "Jane's event",description: "This is the description for Jane's event", creator_id: 1)  
     end

      it 'expects event to be valid' do
            expect(subject).to be_valid
      end

      it 'expects event to not be valid without a date' do
        subject.date = nil
        expect(subject).to_not be_valid
      end

      it 'expects event to not be valid without a title' do
        subject.title = nil
        expect(subject).to_not be_valid
      end

      it 'expects event to not be valid without a description' do
        subject.description = nil
        expect(subject).to_not be_valid
      end

      it 'expects event to not be valid without a creator' do
        subject.creator_id = nil
        expect(subject).to_not be_valid
      end
  end

  context "associations" do
    it 'should belong to a creator' do
      t = Event.reflect_on_association(:creator)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should have many attended events' do
      t = Event.reflect_on_association(:attended_events)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many attending events' do
      t = Event.reflect_on_association(:attendees)
      expect(t.macro).to eq(:has_many)
    end
  end


  

end
