# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Election, type: :model do
  describe '# end_time and start_time comparison' do
    let(:test_election) { build(:election) }

    it 'is not valid if end_time is nil' do
      test_election.end_time = nil
      expect(test_election.save).not_to be_truthy
    end

    it 'is valid if end_time is greater than start_time' do
      test_election.end_time = '2022-09-16 23:00:00'
      expect(test_election.save).to be_truthy
    end

    it 'is not valid if end_time is less than start_time' do
      test_election.end_time = '2022-09-13 00:00:00'
      test_election.save
      expect(test_election.errors.messages[:end_time]).to include('Its in PAST')
    end
  end
end
