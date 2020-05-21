class Api::V1::Merchants::SearchController < ApplicationController

  def index
    require "pry"; binding.pry
  end

  def show
    render json: MerchantSerializer.new(merchant_search.first)
  end

  private

  def merchant_search
    merchant = Merchant.where("LOWER(name) LIKE ?", "%#{params[:name].downcase}%") if params[:name].present?
  end
end
