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
      expect(flash.alert).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'DELETE /users/:id' do
    let(:test_halka) { create(:halka) }
    let(:test_user) { create(:user, halka: test_halka) }

    it 'logged-in user is admin' do
      sign_in admin
      delete user_path(test_user.id)
      expect(User.where(id: test_user.id).count).to eq(0)
    end

    it 'logged-in user is not admin' do
      sign_in not_admin
      delete user_path(test_user.id)
      expect(flash.alert).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'GET /users/:id/show_voters' do
    let(:test_user_candidate) { create(:user, role: 1) } # Create the user with the role of candidate
    let(:test_candidate) { create(:candidate, user_id: test_user_candidate.id, approved: true) } # Assigning the candidate profile to the user
    let(:test_user) { create(:user) } # Simple user to cast the vote

    it 'logged-in user is admin' do
      sign_in admin # Sign in to the application as ADMIN
      test_candidate.votes.create(user_id: test_user.id) # A user is casting the vote against specfic candidate

      get show_voters_user_path(test_candidate.id) # Show voters details

      expect(response.body).to include test_user.cnic # the cnic of the test_user must be inside the
    end

    it 'logged-in user is not admin' do
      sign_in not_admin
      get show_voters_user_path(test_candidate.id)
      expect(flash.alert).to eq('You are not authorized to perform this action.')
    end
  end

  describe 'GET /users/halka_voters' do
    let(:test_halka) { create(:halka) }
    let(:user_candidate) { create(:user, role: 1, halka_id: test_halka.id) }

    it 'show list of voters in halka to only candidate' do
      sign_in user_candidate # This is the candiate User
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
