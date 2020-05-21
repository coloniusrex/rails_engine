class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def self.most_revenue(limit = 5, sort = "DESC")
     Merchant.select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
     .joins(:invoice_items, :invoices, :transactions)
     .merge(Transaction.unscoped.successful)
     .group(:id)
     .order("revenue #{sort}")
     .limit(limit)
  end

  def self.most_items(limit = 5, sort = "DESC")

  end
end
