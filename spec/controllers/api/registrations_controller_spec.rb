require 'rails_helper'

RSpec.describe RegistrationsController, type: :request do
  let (:user) {build_user}
  let (:existing_user) {create_user}
  let (:signup_url) {'/api/signup'}

  context 'When creating a new user' do
    before do
      post signup_url, params: {
        user: {
                email: user.email,
                password: user.password
              }
      }
    end
  end

  it 'expects a 200 status' do
    expect(response.status).to eq(200)

  end

  it 'returns a token' do
    expect(response.headers['Authorization']).to be_present
  end

  it 'returns the user email' do
    expect(json['data']).to have_attribute(:email).with_value(user.email)
  end

  it 'do not return user password' do
    expect(json['data']).not_to have_attribute(:password).with_value(user.password)
  end

  context 'When a user already exists' do
    before do
      post signup_url, params: {
             user: {
               email: existing_user.email,
               password: existing_user.password
             }
           }
    end

    it 'expects a 400 status' do
      expect(response.status).to eq(400)
    end
  end
end
