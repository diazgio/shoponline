
class Current < ActiveSupport::CurrentAttributes
  attribute :user

  def can_access_transaction_page?(transaction: nil)
    
  end
end