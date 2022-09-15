# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:test_vote) { create(:vote) }

  describe '#Associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:candidate) }
  end

  describe '# Check before save callback' do
    it 'Update the given_vote field of user to true' do
      expect(test_vote.save).to eq(true)
    end
  end
end
