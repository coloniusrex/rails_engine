class Invoice < ApplicationRecord
  validates :status, presence: true

  belongs_to :customer
  belongs_to :merchants

  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  # def self.most_revenue(limit = 5, sorting = "DESC")
  #   Invoice.select("invoices.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
  #   .joins(:invoice_items, :transactions)
  #   .merge(Transaction.unscoped.successful)
  #   .group(:id)
  #   .order("revenue #{sorting}")
  #   .limit(limit)
  # end
end
