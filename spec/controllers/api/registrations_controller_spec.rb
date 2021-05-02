require 'rails_helper'

describe RegistrationsController, type: :request do

  let (:user) { User.new(email: 'newuser@new.com', password: '123456') }
  let (:existing_user) { User.create(email: Faker::Internet.email, password: Faker::Internet.password) }
  let (:signup_url) { '/api/signup' }
  #
  # context 'When creating a new user' do
  #   before do
  #     post signup_url, params: { user: { email: user.email, password: user.password } }
  #   end
  #
  #   it 'returns 200' do
  #     expect(response.status).to eq(200)
  #   end
  #
  #   it 'returns a token' do
  #     expect(response.headers['Authorization']).to be_present
  #   end
  #
  #   it 'returns the user email' do
  #     expect(JSON.parse(response.body)['data']).to have_attribute(:email).with_value(user.email)
  #   end
  # end

  context 'When an email already exists' do
    before do
      post signup_url, params: {
        user: {
          email: existing_user.email,
          password: existing_user.password
        }
      }
    end

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end

end
