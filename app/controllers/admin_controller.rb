class AdminController < ApplicationController
  before_action :check_admin

  def index
  end


  private
  def check_admin
    unless current_user.try :admin?
      flash.now.error "Only admin can do that!"
      redirect_to new_user_session_path
    end
  end
end
