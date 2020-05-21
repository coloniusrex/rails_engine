class Api::V1::Merchants::IntelController < ApplicationController

  def show
    method = request.path_info.split('/').last
    if method == "most_revenue"
      render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity].to_i)).serialized_json
    end
  end

end
