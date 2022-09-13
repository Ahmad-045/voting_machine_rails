# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:test_user) { create(:user) }

  describe '# Associations' do
    it { is_expected.to belong_to(:halka) }
    it { is_expected.to have_one(:vote).dependent(:destroy) }
  end

  describe '# validation presence' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cnic) }
    it { is_expected.to define_enum_for(:role).with_values(%i[admin candidate voter]) }
  end

  describe '# when created callback' do
    it 'is valid by setting default user role to voter' do
      test_user.role = nil
      test_user.run_callbacks :create
      expect(test_user.role).to eq('voter')
    end
  end

  describe '# User Avatar' do
    it 'is valid if avatar is attached' do
      expect(test_user.avatar).to be_attached
    end

    it 'is not valid if Avatar is not attached' do
      test_user.avatar.purge
      expect(test_user.avatar).not_to be_attached
    end
  end
end
