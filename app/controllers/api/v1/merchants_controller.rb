class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    render json: MerchantSerializer.new(merchants)
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant)
  end

  def create
    render json: MerchantSerializer.new(Merchant.create(merchant_params))
  end

  def update
    render json: MerchantSerializer.new(Merchant.update(params[:id], merchant_params))
  end

  def destroy
    render json: MerchantSerializer.new(destroy_and_display(params[:id]))
  end

  private

  def merchant_params
    params.permit(:name)
  end

  def destroy_and_display(id)
    merchant = Merchant.find(id)
    merchant.destroy
    merchant
  end
end
