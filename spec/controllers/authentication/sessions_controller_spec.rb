require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user, email: 'test@example.com', password: 'password123') }

    context 'with valid credentials' do
      it 'redirects to the root path' do
        post :create, params: { session: { email: user.email, password: 'password123' } }
        expect(response).to redirect_to(products_path)
      end
    end

    context 'with invalid credentials' do
      it 'renders the new template' do
        post :create, params: { session: { email: 'invalid@example.com', password: 'wrongpassword' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }

    it 'redirects to the root path' do
      delete :destroy
      expect(response).to redirect_to(products_path)
    end
  end
end