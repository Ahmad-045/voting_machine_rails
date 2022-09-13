# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Election, type: :model do
  describe '#validations' do
    it 'is not valid if end time is lower than start time' do
      election = build(:election, end_time: '2022-09-13 12:00:00')
      expect(election).not_to be_valid
    end

    it 'is valid if end time is greater than start time' do
      election = build(:election, end_time: '2022-09-13 18:00:00')
      expect(election).to be_valid
    end

    it 'is not valid if end time is equal to start time' do
      election = build(:election, end_time: '2022-09-13 15:00:00')
      expect(election).not_to be_valid
    end

  end
end
