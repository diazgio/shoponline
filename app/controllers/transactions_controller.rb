class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  def index
    @transactions = Transaction.where(user: current_user).order(created_at: :desc)
  end

  def new
    @transaction = Transaction.new
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def current_user
    current_user ||= Current.user
  end

  def transaction_params
    params.require(:transaction).permit(:product_id, :user_id, :delivery_address, :quantity, :billing_status, :receipt)
  end
end