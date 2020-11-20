class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # デフォルト以外のパラメーターを保存する際に記述
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password, :name, :profile, :occupation, :position])
  end

end
