class TransactionMailer < ApplicationMailer
  def new_transaction
    @transaction = params[:transaction]
    @buyer = @transaction.buyer
    @seller = @transaction.seller
    @buyer_username = @buyer.username
    @seller_username = @seller.username
    @product_title = @transaction.product.title
    @quantity = @transaction.quantity
    @delivery_address = @transaction.delivery_address
    @total = @transaction.total

    mail to: [@buyer.email, @seller.email]
  end
end
