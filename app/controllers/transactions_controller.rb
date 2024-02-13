class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  def index
    @transactions = Transaction.where(user: Current.user).order(created_at: :desc)
  end

  def new
    @transaction = Transaction.new
  end

  def edit
  end

  def show
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        TransactionMailer.with(transaction: @transaction).create.deliver_later
        format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_transaction
    @transaction ||= Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:product_id, :seller_id, :buyer_id, :delivery_address, :quantity, :billing_status, :receipt)
  end
end