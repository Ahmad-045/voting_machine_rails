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
      test_vote.run_callbacks :save do
        test_vote.user.given_vote = true
      end
      expect(test_vote.user.given_vote).to eq(true)
    end
  end
end
