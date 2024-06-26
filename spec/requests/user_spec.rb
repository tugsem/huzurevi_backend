require 'rails_helper'

RSpec.describe 'User', type: :request do 
    describe 'GET /me' do
        it 'returns unauthorized if current user doesnt exist' do
            get '/me'
            expect(response).to have_http_status(:unauthorized)
        end
    end
    describe 'POST /login' do
        let(:valid_user) { FactoryBot.create(:user) }

        it 'logs in the user with valid credentials' do
            post '/login', params: {username: valid_user.username, password: valid_user.password}, as: :json
            expect(response).to have_http_status(:ok)
        end
        it 'returns unauthorized with invalid credentials' do
            post '/login', params: {username: valid_user.username, password: '1'}, as: :json
            expect(response).to have_http_status(:unauthorized)
        end
        it 'returns current user if user logged in' do
            post '/login', params: {username: valid_user.username, password: valid_user.password}, as: :json
            get '/me'
            response_body = JSON.parse(response.body)
            expect(response_body['username']).to eq(valid_user.username)
        end
    end 
    describe 'POST /signup' do
        let(:user) { FactoryBot.build(:user) }

        it 'creates new user with valid credentials' do
            post '/signup', params: {username: user.username, password: user.password}, as: :json
            expect(response).to have_http_status(:created)
        end

        it 'returns 422 with invalid credentials' do
            post '/signup', params: {username: user.username, password: '1'}, as: :json
            expect(response).to have_http_status(422)
        end
    end  
end