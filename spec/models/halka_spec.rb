# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Halka, type: :model do
  describe '#associations' do
    it { is_expected.to have_many(:users).dependent(:destroy) }

    it { is_expected.to have_many(:candidates).dependent(:destroy) }
  end

  describe '#validations' do
    it 'is valid if name is present' do
      halka = build(:halka)
      expect(halka).to be_valid
    end

    it 'is not valid if name is nil' do
      halka = build(:halka, name: nil)
      expect(halka).not_to be_valid
    end

    it 'is not valid if name is empty string' do
      halka = build(:halka, name: '')
      expect(halka).not_to be_valid
    end
  end
end
