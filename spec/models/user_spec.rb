require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    subject do
      described_class.new(username: 'Jane')
    end

    it 'expects username to be valid' do
      expect(subject).to be_valid
    end

    it 'is not valid without a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it 'should have many events' do
      t = User.reflect_on_association(:events)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many attended events' do
      t = User.reflect_on_association(:attended_events)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many attending events' do
      t = User.reflect_on_association(:attending_events)
      expect(t.macro).to eq(:has_many)
    end
  end
end
