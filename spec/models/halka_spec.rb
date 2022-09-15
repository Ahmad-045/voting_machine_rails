# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Halka, type: :model do
  let(:test_halka) { create(:halka) }

  describe '#associations' do
    it { is_expected.to have_many(:users).dependent(:destroy) }

    it { is_expected.to have_many(:candidates).dependent(:destroy) }
  end

  describe '#validation Presence' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
