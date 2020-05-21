class Api::V1::Merchants::IntelController < ApplicationController

  def index
    method = request.path_info.split('/').last
    if method == "most_revenue"
      merchants = Merchant.most_revenue(params[:quantity].to_i)
      render json: MerchantSerializer.new(merchants).serialized_json
    elsif method == "most_items"
      merchants = Merchant.most_items(params[:quantity].to_i)
      render json: MerchantSerializer.new(merchants).serialized_json
    end
  end
end
