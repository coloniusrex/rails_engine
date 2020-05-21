class Transaction < ApplicationRecord
  validates :credit_card_number, presence: true
  validates :credit_card_expiration_date, presence: false
  validates :result, presence: true
  belongs_to :invoice
  has_many :invoice_items, through: :invoice
  has_many :items, through: :invoice_items

  default_scope { order(id: :asc) }
  scope :successful, -> { where(result: "success") }
end
