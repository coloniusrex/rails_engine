class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params[:id])
  end

  def create
    render json: Customer.create(customer_params)
  end

  def update
    render json: Customer.update(params[:id], customer_params)
  end

  def destroy
    render json: Customer.delete(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end
end
