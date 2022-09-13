require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe '#Associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:candidate) }
  end
end
