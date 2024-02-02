require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new category" do
        expect {
          post :create, params: { category: { name: "New Category" } }
        }.to change(Category, :count).by(1)
      end

      it "redirects to the created category" do
        post :create, params: { category: { name: "New Category" } }
        expect(response).to redirect_to(category_url(Category.last))
      end

      it "sets a success notice" do
        post :create, params: { category: { name: "New Category" } }
        expect(flash[:notice]).to eq("Category was successfully created.")
      end
    end

    context "with invalid parameters" do
      it "does not create a new category" do
        expect {
          post :create, params: { category: { name: "" } }
        }.not_to change(Category, :count)
      end

      it "renders the new template" do
        post :create, params: { category: { name: "" } }
        expect(response).to render_template(:new)
      end

      it "sets an error message" do
        post :create, params: { category: { name: "" } }
        expect(flash[:error]).to eq("Category could not be created.")
      end
    end
  end

  describe "PATCH #update" do
    let(:category) { create(:category) }

    context "with valid parameters" do
      it "updates the category" do
        patch :update, params: { id: category.id, category: { name: "Updated Category" } }
        category.reload
        expect(category.name).to eq("Updated Category")
      end

      it "redirects to the updated category" do
        patch :update, params: { id: category.id, category: { name: "Updated Category" } }
        expect(response).to redirect_to(category_url(category))
      end
    end

    context "with invalid parameters" do
      it "does not update the category" do
        patch :update, params: { id: category.id, category: { name: "" } }
        category.reload
        expect(category.name).not_to eq("")
      end

      it "renders the edit template" do
        patch :update, params: { id: category.id, category: { name: "" } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:category) { create(:category) }

    it "destroys the category" do
      expect {
        delete :destroy, params: { id: category.id }
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories index" do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(categories_url)
    end

    it "sets a success notice" do
      delete :destroy, params: { id: category.id }
      expect(flash[:notice]).to eq("Category was successfully destroyed.")
    end
  end
end
