class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def check_user
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
