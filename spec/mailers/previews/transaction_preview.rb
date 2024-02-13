# Preview all emails at http://localhost:3000/rails/mailers/transaction
class TransactionPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/transaction/create
  def create
    TransactionMailer.create
  end

end
