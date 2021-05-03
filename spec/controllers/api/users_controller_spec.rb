require 'rails_helper'

describe Api::UsersController, type: :request do
  let (:user) {create_user}

  context 'When fetching a user' do
    before do
      login_with_api(user)
      get "/api/users/#{user.id}", headers: {'Authorization': response.headers['Authorization']}
    end

    it 'expects a 200 status' do
      expect(response.status).to eq(200)
    end

    it 'returns the user' do
      expect(json['data']).to have_id(user.id.to_s)
      expect(json['data']).to have_type('users')
    end
  end
end
