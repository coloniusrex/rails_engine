class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def self.most_revenue(limit = 5, sort = "DESC")
     Merchant.select("invoices.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
     .joins(:invoice_items, :invoices)
     .merge(Transaction.unscoped.successful)
     .group(:id)
     .order("revenue #{sort}")
     .limit(limit)
  end
end
