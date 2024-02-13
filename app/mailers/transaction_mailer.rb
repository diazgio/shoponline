class TransactionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.transaction_mailer.create.subject
  #
  def create
    @transaction = params[:transaction]
    @buyer = @transaction.buyer
    @seller_username = @transaction.seller.username
    @product = @transaction.product
    @quantity = @transaction.quantity
    @delivery_address = @transaction.delivery_address
    @total = @transaction.total

    mail to: [@buyer.email, @seller.email]
  end
end
