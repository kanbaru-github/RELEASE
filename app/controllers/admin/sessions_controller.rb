class Admin::SessionsController < Devise::SessionsController

  before_action :not_customer

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      redirect_to new_admin_session_path, notice: '会員ログイン中です。'
    else
      admin_posts_path
    end
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

private

  def not_customer
    if customer_signed_in?
      redirect_to root_path
    end
  end

end
