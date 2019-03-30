class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # resourceに入ってくるもの
  # <User id: 7, email: "xojan0120+devise_test@gmail.com", created_at: "2019-03-29 13:05:16", updated_at: "2019-03-29 13:13:23", provider: "twitter", uid: "2867608933", username: "xojan0120">
  def after_sign_in_path_for(resource)
    pages_show_path
  end

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end 
end
