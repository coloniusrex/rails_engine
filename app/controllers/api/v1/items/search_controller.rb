class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: ItemSerializer.new(item_search).serialized_json
  end

  def show

    render json: ItemSerializer.new(item_search.first)
  end

  private

  def item_search
    item = Item.where("LOWER(name) LIKE ?", "%#{params[:name].downcase}%") if params[:name].present?
    item = Item.where("LOWER(description) LIKE ?", "%#{params[:description].downcase}%") if params[:description].present?
    item = Item.where("LOWER(description) LIKE ?", Data.parse(params[:created_at])) if params[:created_at].present?
    item = Item.where("LOWER(description) LIKE ?", Data.parse(params[:updated_at])) if params[:updated_at].present?
    item
  end
end
