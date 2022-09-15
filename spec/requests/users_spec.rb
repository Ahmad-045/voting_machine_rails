require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:admin) { create(:user, role: 0) }
  let(:not_admin) { create(:user, role: rand(1..2)) }

  describe 'GET /index' do
    it 'logged-in user is admin' do
      sign_in admin
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'logged-in user is not admin' do
      sign_in not_admin
      get users_path
      expect(flash.keys).to eq(['alert'])
    end
  end

  describe 'DELETE /users/:id' do
    let(:test_halka) { create(:halka) }
    let(:test_user) { create(:user, halka: test_halka) }

    it 'logged-in user is admin' do
      sign_in admin
      delete user_path(test_user.id)
      expect(flash.keys).to eq(['notice'])
    end

    it 'cannot delete if there is not user with particular id' do
      sign_in admin
      delete user_path(rand(1234))
      expect(flash.keys).to eq(['alert'])
    end

    it 'logged-in user is not admin' do
      sign_in not_admin
      delete user_path(test_user.id)
      expect(flash.keys).to eq(['alert'])
    end
  end

  describe 'GET /users/:id/show_voters' do
    let(:test_user_candidate) { create(:user, role: 1) } # Create the user with the role of candidate
    let(:test_candidate) { create(:candidate, user_id: test_user_candidate.id, approved: true) } # Assigning the candidate profile to the user
    # let(:test_user) { create(:user) } # Simple user to cast the vote

    it 'logged-in user is admin' do
      sign_in admin # Sign in to the application as ADMIN
      get show_voters_user_path(test_candidate.id) # Show voters details
      expect(response).to have_http_status(:ok)
    end

    it 'logged-in user is not admin' do
      sign_in not_admin
      get show_voters_user_path(test_candidate.id)
      expect(flash.keys).to eq(['alert'])
    end
  end

  describe 'GET /users/halka_voters' do
    let(:test_halka) { create(:halka) }
    let(:test_candidate) { create(:user, role: 1, halka_id: test_halka.id) }

    it 'show list of voters in halka to only candidate' do
      sign_in test_candidate
      get halka_voters_users_path
      expect(response).to have_http_status(:ok)
    end

    it 'redirect to root_path.., if not a candidate' do
      sign_in create(:user)
      get halka_voters_users_path
      expect(response).to redirect_to(root_url)
    end
  end
end
