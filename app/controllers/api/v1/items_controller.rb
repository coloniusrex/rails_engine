class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    merchant = Merchant.find(item_params[:merchant_id])
    render json: ItemSerializer.new(merchant.items.create(item_params))
  end

  def update
    render json: ItemSerializer.new(Item.update(params[:id], item_params))
  end

  def destroy


    render json: ItemSerializer.new(destroy_and_display(params[:id]))
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end

  def destroy_and_display(id)
    item = Item.find(id)
    item.destroy
    item
  end
end
