class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
    format: {
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: :invalid
    }
  
  validates :username, presence: true, uniqueness: true,
    length: { in: 3..15 },
    format: {
      with: /\A[a-z0-9A-Z]+\z/,
      message: :invalid
    }

  validates :password, length: { minimum: 6 }, if: :password_digest_changed?

  has_many :products, dependent: :destroy
  has_many :favorites, dependent: :destroy
  enum role: [:user , :company, :admin]

  before_save :downcase_attributes

  ROLES = %w[user company admin]

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end

  def is_seller?
    self.products.any?
  end

  def is_buyer?
    Transaction.where(buyer_id: self.id).any?
  end

  private

  def downcase_attributes
    self.username = username.downcase
    self.email = email.downcase
  end
end
