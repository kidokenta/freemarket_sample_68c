class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:famiry_name,:first_name,:famiry_name_kana,:first_name_kana,:birthday,:postal_code,:adress_prefecture,:adress_town,:adress_number,:adress_name])
  end


end
