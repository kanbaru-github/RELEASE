class Public::SessionsController < Devise::SessionsController

  before_action :reject_inactive_customer, only: [:create]
  before_action :not_admin

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def reject_inactive_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_active
        flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_customer_session_path
      end
    end
  end

  def not_admin
    if admin_signed_in?
      redirect_to root_path
    end
  end

end
