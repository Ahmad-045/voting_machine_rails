# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Halka, type: :model do
  let(:test_halka) { create(:halka) }

  describe '#associations' do
    it { is_expected.to have_many(:users).dependent(:destroy) }

    it { is_expected.to have_many(:candidates).dependent(:destroy) }
  end

  describe '# validations' do
    it 'is valid if name is present' do
      expect(test_halka).to be_valid
    end

    it 'is not valid if name is nil' do
      test_halka.name = nil
      expect(test_halka).not_to be_valid
    end

    it 'is not valid if name is empty string' do
      test_halka.name = ''
      expect(test_halka).not_to be_valid
    end
  end
end
