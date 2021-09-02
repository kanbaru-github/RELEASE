class Public::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params

  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  # end

  def after_sign_up_path_for(resource)
    current_customer.create
    WelcomeMailer.send_when_create(current_customer).deliver
    posts_path
  end

  def after_update_path_for(resource)
    posts_path
  end
end
