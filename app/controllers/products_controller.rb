class ProductsController < ApplicationController
  skip_before_action :protect_pages, only: [:index, :show]
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @categories = Category.order(name: :asc)
    @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index), items: 12)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
    authorize! @product
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: t('.created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! @product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: t('.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, notice: t('.destroyed'), status: :see_other}
    end
  end

  private
    def set_product
      @product ||= Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title,
        :description,
        :price,
        :stock,
        :photo,
        :category_id
      )
    end

    def product_params_index
      params.permit(:category_id,
        :min_price,
        :max_price,
        :query_text,
        :order_by,
        :page,
        :favorites,
        :user_id
      )
    end
end
