require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all products as @products' do
      product = Product.create(name: 'Example Product', price: 10.99)
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      product = Product.create(name: 'Example Product', price: 10.99)
      get :show, params: { id: product.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested product as @product' do
      product = Product.create(name: 'Example Product', price: 10.99)
      get :show, params: { id: product.to_param }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new product as @product' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      product = Product.create(name: 'Example Product', price: 10.99)
      get :edit, params: { id: product.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested product as @product' do
      product = Product.create(name: 'Example Product', price: 10.99)
      get :edit, params: { id: product.to_param }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Product' do
        expect {
          post :create, params: { product: { name: 'New Product', price: 9.99 } }
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the created product' do
        post :create, params: { product: { name: 'New Product', price: 9.99 } }
        expect(response).to redirect_to(product_url(Product.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new Product' do
        expect {
          post :create, params: { product: { name: nil, price: 9.99 } }
        }.to_not change(Product, :count)
      end

      it 'renders the new template with unprocessable entity status' do
        post :create, params: { product: { name: nil, price: 9.99 } }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:product) { Product.create(name: 'Example Product', price: 10.99) }

      it 'updates the requested product' do
        patch :update, params: { id: product.to_param, product: { name: 'Updated Product' } }
        product.reload
        expect(product.name).to eq('Updated Product')
      end

      it 'redirects to the product' do
        patch :update, params: { id: product.to_param, product: { name: 'Updated Product' } }
        expect(response).to redirect_to(product_url(product))
      end
    end

    context 'with invalid params' do
      let(:product) { Product.create(name: 'Example Product', price: 10.99) }

      it 'does not update the requested product' do
        patch :update, params: { id: product.to_param, product: { name: nil } }
        product.reload
        expect(product.name).to eq('Example Product')
      end

      it 'renders the edit template with unprocessable entity status' do
        patch :update, params: { id: product.to_param, product: { name: nil } }
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { Product.create(name: 'Example Product', price: 10.99) }

    it 'destroys the requested product' do
      expect {
        delete :destroy, params: { id: product.to_param }
      }.to change(Product, :count).by(-1)
    end

    it 'redirects to the products list' do
      delete :destroy, params: { id: product.to_param }
      expect(response).to redirect_to(products_url)
    end
  end
end