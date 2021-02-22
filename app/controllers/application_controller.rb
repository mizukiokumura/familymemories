class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :jp_first_name, :jp_last_name, :jp_kana_first_name, :jp_kana_last_name, :birthday, :profile])
  end

  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys:[:nickname, :jp_first_name, :jp_last_name,:jp_kana_first_name, :jp_kana_last_name, :birthday, :profile])
  end

end
