require 'rails_helper'

RSpec.describe Authentication::UsersController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: { username: 'JohnDoe', email: 'john@example.com', password: '123456' } }
        }.to change { User.count }.by(1)
      end

      it 'redirects to the products page' do
        post :create, params: { user: { username: 'JohnDoe', email: 'john@example.com', password: '123456' } }
        expect(response).to redirect_to(products_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect {
          post :create, params: { user: { username: '', email: 'john@example.com', password: '123456' } }
        }.not_to change(User, :count)
      end

      it 'does not create a new user' do
        expect {
          post :create, params: { user: { username: 'JohnDoe', email: '', password: '123456' } }
        }.not_to change(User, :count)
      end


      it 'does not create a new user' do
        expect {
          post :create, params: { user: { username: 'JohnDoe', email: 'john@example.com', password: '' } }
        }.not_to change(User, :count)
      end

      it 'does not create a new user' do
        expect {
          post :create, params: { user: { username: 'JohnDoe', email: 'john@example.com', password: '12345' } }
        }.not_to change(User, :count)
      end

      it 'does not create a new user' do
        expect {
          post :create, params: { user: { username: 'JohnDoe', email: 'john.com', password: '12345' } }
        }.not_to change(User, :count)
      end
    end
  end
end