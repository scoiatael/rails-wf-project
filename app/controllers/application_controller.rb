class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_action :check_admin, only: :admin

  def index
  end

  def admin
  end

  protected
  def check_user
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def check_admin
    unless current_user.try :admin?
      flash[:error] = "Only admin can do that!"
      redirect_to root_path
    end
  end

  def record_not_found
  end
end
