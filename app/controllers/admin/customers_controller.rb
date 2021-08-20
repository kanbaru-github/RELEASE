class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(20)
    # デフォルトは25件
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]="会員情報を更新しました"
    # binding.pry
      redirect_to admin_customers_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :is_active)
  end

end
