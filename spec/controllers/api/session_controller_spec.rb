require 'rails_helper'

describe SessionsController, type: :request do
  let (:user) {create_user}
  let (:login_url) {'/api/login'}
  let (:logout_url) {'/api/logout'}

  context 'When a user is logging in' do
    before do
      login_with_api(user)
    end

    it 'returns a bearer token' do
      token = response.headers['Authorization']
      expect(token).to start_with("Bearer ")
    end

    it 'expects a 200 status' do
      expect(response.status).to eq(200)
    end
  end

  context 'When a password is missing' do
    before do
      post login_url, params: {
             user: {
               email: user.email,
               password: nil}}
    end

    it 'expects a 401' do
      expect(response.status).to eq(401)
    end
  end

  context 'When a user is logging out' do
    it 'returns 204' do
      delete logout_url
      expect(response).to have_http_status(204)
    end
  end
end
