class Transaction < ApplicationRecord
  has_one_attached :receipt

  belongs_to :product
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'

  enum billing_status: [:pending, :paid, :canceled]

  def total
    product.price * quantity
  end

  def format_created_at
    created_at.strftime('%d-%m-%y %H:%M:%S')
  end

  def seller?
    seller_id == Current.user.id
  end
end
