# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HalkaController', type: :request do
  let(:admin) { create(:user, role: 0) }
  let(:not_admin) { create(:user, role: rand(1..2)) }
  let(:test_halka) { create(:halka) }

  describe 'GET /halka' do
    it 'show halka list if admin' do
      sign_in admin
      get halka_index_path
      expect(response).to have_http_status(:ok)
    end

    it 'check flash error if user role is not admin' do
      sign_in not_admin
      get halka_index_path
      expect(flash.keys).to eq(['alert'])
    end
  end

  describe 'GET /halka/new' do
    it 'can create new halka if user is admin' do
      sign_in admin
      get new_halka_path
      post halka_index_path, params: { halka: { name: 'NA-321' } }
      expect(flash.keys).to eq(['notice'])
    end

    it 'cannot create new halka if user is not admin' do
      sign_in not_admin
      get new_halka_path
      post halka_index_path, params: { halka: { name: 'NA-321' } }
      expect(flash.keys).to eq(['alert'])
    end
  end

  describe 'DELETE /halka/:id' do
    it 'can delete halka if user is admin' do
      sign_in admin
      delete halka_path(test_halka.id)
      expect(flash.keys).to eq(['notice'])
    end

    it 'cannot delete halka if user is not admin' do
      sign_in not_admin
      delete halka_path(test_halka.id)
      expect(flash.keys).to eq(['alert'])
    end
  end

  describe 'User not Sign in' do
    let(:test_user) { create(:user) }

    it 'cannot VIEW halka list' do
      get halka_index_path
      expect(flash.keys).to eq(['alert'])
    end

    it 'cannot CREATE new halka' do
      get new_halka_path
      expect(flash.keys).to eq(['alert'])
    end

    it 'cannot DELETE new halka' do
      delete halka_path(test_halka.id)
      expect(flash.keys).to eq(['alert'])
    end
  end
end
