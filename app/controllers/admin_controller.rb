class AdminController < ApplicationController
  before_action :check_admin

  def index
  end

  def users
  end

  def user
    @user = User.find(params[:id])
  end


  private
  def check_admin
    unless current_user.try :admin?
      flash[:error] = "Only admin can do that!"
      redirect_to root_path
    end
  end
end
