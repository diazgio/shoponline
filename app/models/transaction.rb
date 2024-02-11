class Transaction < ApplicationRecord
  has_one_attached :receipt

  belongs_to :product
  belongs_to :user

  enum billing_status: [:pending, :paid, :canceled]
end
