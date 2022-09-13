require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validation presence' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cnic) }
  end
end
