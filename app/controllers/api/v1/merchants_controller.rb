class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
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
