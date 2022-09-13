# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Candidate, type: :model do
  let(:test_candidate) { create(:candidate) }

  describe '#associations' do
    it { is_expected.to belong_to(:halka) }

    it { is_expected.to have_many(:votes).dependent(:destroy) }
  end

  describe '#validation Presence' do
    it { is_expected.to validate_presence_of(:party_name) }
  end

  describe '#party symbol' do
    it 'is valid if party symbol attached' do
      expect(candidate.party_symbol).to be_attached
    end

    it 'is not valid if party symbol not attached' do
      test_candidate.party_symbol.purge
      expect(candidate.party_symbol).not_to be_attached
    end
  end
end
