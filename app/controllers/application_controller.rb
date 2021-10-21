class ApplicationController < ActionController::Base

  def forbid_login_user
    if current_customer
      flash[:notice] = "すでにログインしています"
      redirect_to posts_path
    end
  end

end