class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

  def index
    if params[:keyword].present?
    # [:keyword]に値が入ってたら
      if params[:keyword].empty?
        # [:keyword]の中身が空だったら
        @customers = Customer.page(params[:page]).per(20)
        # デフォルトは25件
      else
        # [:keyword]の中身が空じゃなかったら
        @customers = Customer.where('email LIKE(?)', "%#{params[:keyword]}%")
      end
    else
      # [:keyword]が存在しなかったら
      @customers = Customer.page(params[:page]).per(20)
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]="会員情報を更新しました"
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
