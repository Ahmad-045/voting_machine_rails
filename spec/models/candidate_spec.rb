require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:halka) }

    it { is_expected.to have_many(:votes).dependent(:destroy) }
  end

  describe '#validation Presence' do
    it { is_expected.to validate_presence_of(:party_name) }
  end

  describe '#party symbol' do
    it 'is valid if party symbol attached' do
      candidate = build(:candidate)
      candidate.party_symbol.attach(
        io: File.open(Rails.root.join('/home/dev/Desktop/finalProject/voting_machine/app/assets/images/ahmad.jpg')),
        filename: 'ahmad.jpg', content_type: 'image/jpg'
      )
      expect(candidate.party_symbol).to be_attached
    end

    it 'is not valid if party symbol not attached' do
      candidate = build(:candidate)
      expect(candidate.party_symbol).not_to be_attached
    end
  end
end
